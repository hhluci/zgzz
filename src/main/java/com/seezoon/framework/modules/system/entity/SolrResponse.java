package com.seezoon.framework.modules.system.entity;

import java.util.List;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.entity
 * @Description: solr查询结果实体类
 * @Date: Created in 20:58 2018/8/18
 */
public class SolrResponse<T> {

    /**当前页面号*/
    private int current;
    /**页面行数*/
    private int rowCount;
    /**总行数*/
    private long number;
    /**每行信息*/
    private List<T> rowMsg;

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public List<T> getRowMsg() {
        return rowMsg;
    }

    public void setRowMsg(List<T> rowMsg) {
        this.rowMsg = rowMsg;
    }
}
