package com.seezoon.framework.modules.system.solr;

import com.alibaba.fastjson.JSON;
import com.seezoon.framework.common.context.utils.PropertyUtil;
import com.seezoon.framework.common.http.HttpRequestUtils;
import com.seezoon.framework.modules.system.entity.SolrDoc;
import com.seezoon.framework.modules.system.entity.SolrResponse;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.service
 * @Description: Solr服务
 * @Date: Created in 14:34 2018/8/18
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class SolrService {

    private SolrQuery solrQuery;
    private QueryResponse response;
    private SolrDocumentList solrDocumentList;

    /**
     * 获取HTTPSolrClient对象
     * @return
     */
    private SolrClient getClient(){

        return new HttpSolrClient.Builder(PropertyUtil.getString("solr.host"))
                .withConnectionTimeout(10000)
                .withSocketTimeout(60000)
                .build();
    }

    /**
     * 关闭连接
     * @param client
     */
    private void closeClient(@NotNull SolrClient client){
        try {
            client.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 预定义查询
     * @param current 当前页数  应该设置默认 1
     * @param rowCount 每页数量 应该设置默认 10
     * @param info 查询内容     应该设置默认*:*
     * @return
     * @throws IOException
     * @throws SolrServerException
     */
    public String solrSearchTemplate(@NotNull Integer current, @NotNull Integer rowCount, @NotNull String info) throws IOException, SolrServerException {

        this.solrQuery = new SolrQuery();
        solrQuery.setStart((current - 1) * rowCount)
                .setRows(rowCount)
                .setQuery(info)
                .set("wt", "json");

        return solrSearch(solrQuery, current, rowCount);
    }

    /**
     * 自定义查询
     * @param current 当前页数  应该设置默认 1
     * @param rowCount 每页数量 应该设置默认 10
     * @param solrQuery 只允许返回json格式
     * @return
     */
    public String solrSearch(@NotNull SolrQuery solrQuery, @NotNull Integer current, @NotNull Integer rowCount) throws IOException, SolrServerException {

        SolrClient client = this.getClient();

        if (!solrQuery.get("wt").equals("json") || solrQuery.get("wt").isEmpty()){
            solrQuery.set("wt","json");
        }

        this.response = client.query(solrQuery);
        this.solrDocumentList = this.response.getResults();
        List<SolrDoc> list = new ArrayList<>();
        for (SolrDocument document: solrDocumentList){
            String file = (String) document.get("id");
            Object content =  document.get("content");
            long size = (Long) document.get("size");
            SolrDoc solrDoc = new SolrDoc(file, size, content.toString());
            list.add(solrDoc);
        }

        SolrResponse<SolrDoc> solrDocSolrResponse = new SolrResponse<>();
        solrDocSolrResponse.setCurrent(current);
        solrDocSolrResponse.setRowCount(rowCount);
        solrDocSolrResponse.setNumber(solrDocumentList.getNumFound());
        solrDocSolrResponse.setRowMsg(list);

        this.closeClient(client);

        return JSON.toJSONString(solrDocSolrResponse);
    }

    /**
     * 文件上传至指定目录后启用commit
     * 重新构建文件索引
     */
    public void commit() {
        Map<String, String> params = new HashMap<>();
        params.put("command", "full-import");
        params.put("clean", "false");
        params.put("commit", "true");

        HttpRequestUtils.doGet(PropertyUtil.getString("solr.host.updateIndex"), params);

    }

    /**
     * 执行文件删除操作后（慎用）
     * 更新索引库
     * 重量级操作 高并发时会产生阻塞  使服务器崩溃
     */
    public void optimize(){
        Map<String, String> params = new HashMap<>();
        params.put("command", "full-import");
        params.put("clean", "true");
        params.put("Optimize", "true");

        HttpRequestUtils.doGet(PropertyUtil.getString("solr.host.updateIndex"), params);

    }

}
