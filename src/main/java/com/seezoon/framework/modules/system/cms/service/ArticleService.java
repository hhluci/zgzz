package com.seezoon.framework.modules.system.cms.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.seezoon.framework.common.service.BaseService;
import com.seezoon.framework.common.utils.IdGen;
import com.seezoon.framework.modules.system.cms.dao.ArticleDao;
import com.seezoon.framework.modules.system.cms.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms.service
 * @Description: 文章内容server
 * @Date: Created in 21:51 2018/8/26
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ArticleService extends BaseService {

    @Autowired
    private ArticleDao articleDao;

    /*-------------------------- admin --------------------------*/

    /**
     * 查询所有文章信息
     * @param pageNum
     * @param pageLimit
     * @return
     */
    @Transactional(readOnly = true)
    public PageInfo<Article> findAll(Integer pageNum, Integer pageLimit){

        PageHelper.startPage(pageNum, pageLimit);
        List<Article> articles = articleDao.findAll();

        return new PageInfo<>(articles, pageLimit);
    }

    /**
     * article中需要传入参数有:
     *     title、content、searchKeyword、searchContent
     *     isUse、category、createBy、updateBy
     * @param article
     */
    public void addArticle(Article article){

        article.setId(IdGen.uuid());
        article.setCreateDate(new Date());
        article.setUpdateDate(article.getCreateDate());
        article.setClick(0);
        article.setReply(0);
        article.setRemarks(null);

        articleDao.addArticle(article);

    }


    /**
     * 允许修改内容有：
     *     title、content、searchKeyword
     *     searchContent、isUse、category
     *     updateBy、updateDate、remarks
     * @param article
     */
    public void updateArticle(Article article){

        article.setUpdateDate(new Date());
        articleDao.updateArticle(article);

    }

    /**
     * 通过指定文章id删除该文章
     * @param id
     */
    public void deleteArticle(String id){
        articleDao.delete(id);
    }

    /*-------------------------- admin --------------------------*/

    /**
     * 通过分类名查询对应的文章
     * @param category
     * @return 文章id, title, update_date
     */
    @Transactional(readOnly = true)
    public List<Article> getArticleMsgByCategory(String category){
        return articleDao.findTitleAndUpdateDate(category);
    }

    /**
     * 通过文章id查询文章所有信息
     * @param id
     * @return
     */
    @Transactional(readOnly = true)
    public Article getArticleAllMsgById(String id){
        return articleDao.findArticle(id);
    }

    /**
     * 更新阅读数量
     * @param id
     */
    public void updateClick(String id){
        articleDao.updateClick(id);
    }

}
