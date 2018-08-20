package com.seezoon.framework.modules.system.entity;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.entity
 * @Description: solr查询结果实体类
 * @Date: Created in 20:57 2018/8/18
 */
public class SolrDoc {

    private String file;
    private long size;
    private String content;

    public SolrDoc(String file, long size, String content) {
        this.file = file;
        this.size = size;
        this.content = content;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
