package com.seezoon.framework.modules.system.cms.entity;

import com.seezoon.framework.common.entity.BaseEntity;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms.entity
 * @Description: 文章内容
 * @Date: Created in 9:23 2018/8/26
 */
public class Article extends BaseEntity<String> {

    /**文章标题*/
    private String title;
    /**文章内容*/
    private String content;
    /**网站关键词*/
    private String searchKeyword;
    /**网站描述*/
    private String searchContent;
    /**阅读次数*/
    private Integer click;
    /**回复数量*/
    private Integer reply;
    /**是否使用*/
    private Integer isUse;
    /**分类*/
    private String category;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Integer getReply() {
        return reply;
    }

    public void setReply(Integer reply) {
        this.reply = reply;
    }

    public Integer getIsUse() {
        return isUse;
    }

    public void setIsUse(Integer isUse) {
        this.isUse = isUse;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
