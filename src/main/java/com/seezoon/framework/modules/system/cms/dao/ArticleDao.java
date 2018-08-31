package com.seezoon.framework.modules.system.cms.dao;

import com.github.pagehelper.PageInfo;
import com.seezoon.framework.common.dao.CrudDao;
import com.seezoon.framework.modules.system.cms.entity.Article;

import java.util.List;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms.dao
 * @Description: 文章dao
 * @Date: Created in 9:52 2018/8/26
 */
public interface ArticleDao extends CrudDao<Article> {

    /*-------------------------- admin --------------------------*/

    /**
     * 查询所有信息
     * @return
     */
    List<Article> findAll();

    /**
     * 添加文章
     * @param article
     */
    void addArticle(Article article);

    /**
     * 更新文章信息
     * @param article
     */
    void updateArticle(Article article);

    /**
     * 删除指定信息
     * @param id
     */
    void delete(String id);

    /*-------------------------- public --------------------------*/

    /**
     * 通过分类查询对应文章id，名称和更新时间
     * @param category
     * @return
     */
    List<Article> findTitleAndUpdateDate(String category);

    /**
     * 通过id查询指定文章的所有信息
     * @param id
     * @return
     */
    Article findArticle(String id);

    /**
     * 更新阅读量
     * @param id
     */
    void updateClick(String id);


}
