package com.seezoon.framework.modules.system.cms.entity;

import com.seezoon.framework.common.entity.BaseEntity;

import java.util.Date;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms
 * @Description: 分类信息
 * @Date: Created in 9:05 2018/8/24
 */
public class Category extends BaseEntity<String> {

    private String name;
    private Integer use;
    private Integer orderNo;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUse() {
        return use;
    }

    public void setUse(Integer use) {
        this.use = use;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    @Override
    public String toString() {
        return "Category{" +
                "name='" + name + '\'' +
                ", use=" + use +
                ", orderNo=" + orderNo +
                '}';
    }
}
