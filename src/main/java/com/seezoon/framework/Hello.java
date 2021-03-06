package com.seezoon.framework;

import com.seezoon.framework.common.context.beans.ResponeModel;
import com.seezoon.framework.modules.system.solr.SolrService;
import org.apache.solr.client.solrj.SolrServerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework
 * @Description:
 * @Date: Created in 10:41 2018/8/20
 */
@Controller
@RequestMapping(value = "/hello")
public class Hello {

    @Autowired
    private SolrService solrService;

    @RequestMapping(value = "/hello.do")
    @ResponseBody
    public ResponeModel hello(){
        return ResponeModel.ok("成功");
    }

    @RequestMapping(value = "/search")
    @ResponseBody
    public String solrSearch(){
        try {
            return solrService.solrSearchTemplate(0, 10, "*:*");
        } catch (IOException | SolrServerException e) {
            e.printStackTrace();
            return "查询失败";
        }
    }

}
