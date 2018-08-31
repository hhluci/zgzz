package com.seezoon.framework.modules.system.cms.Controller;

import com.seezoon.framework.common.context.beans.ResponeModel;
import com.seezoon.framework.common.web.BaseController;
import com.seezoon.framework.modules.system.cms.entity.Article;
import com.seezoon.framework.modules.system.cms.service.ArticleService;
import com.seezoon.framework.modules.system.cms.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms.Controller
 * @Description: 文章服务controller
 * @Date: Created in 11:11 2018/8/27
 */
@RestController
@RequestMapping(value = "/article")
public class ArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;

    /*-------------------------- admin --------------------------*/

    @PostMapping(value = "/admin/{userName}/findall.do")
    public ResponeModel findAll(@RequestParam(value = "pagenum", defaultValue = "1") Integer pageNum,
                                @RequestParam(value = "pagelimit", defaultValue = "10") Integer pageLimit){
        return ResponeModel.ok(articleService.findAll(pageNum, pageLimit));
    }

    /**
     * 添加新文章
     * @param title @NotNull
     * @param content @NotNull
     * @param searchKey
     * @param searchContent
     * @param isUse @NotNull
     * @param category @NotNull
     * @param username @NotNull
     * @return
     */
    @PostMapping(value = "/admin/{userName}/addarticle.do")
    public ResponeModel addArticle(@RequestParam(value = "title") @NotNull String title, @RequestParam(value = "content") @NotNull String content,
                                   @RequestParam(value = "searchkey") String searchKey, @RequestParam(value = "searchcontent") String searchContent,
                                   @RequestParam(value = "use", defaultValue = "1") Integer isUse, @RequestParam(value = "category") @NotNull String category,
                                   @PathVariable(value = "userName") String username){

        Article article = new Article();
        article.setTitle(title);
        article.setContent(content);
        article.setSearchKeyword(searchKey);
        article.setSearchContent(searchContent);
        article.setIsUse(isUse);
        article.setCategory(category);
        article.setCreateBy(username);
        article.setUpdateBy(username);

        articleService.addArticle(article);

        return ResponeModel.ok();
    }

    /**
     * 文章更新
     * @param id @NotNull
     * @param title
     * @param content
     * @param searchKey
     * @param searchContent
     * @param isUse
     * @param category
     * @param userName @NotNull
     * @param remarks
     * @return
     */
    @PostMapping(value = "/admin/{userName}/updateArticle.do")
    public ResponeModel updateArticle(@RequestParam(value = "id") @NotNull String id, @RequestParam(value = "title", required=false) String title,
                                      @RequestParam(value = "content", required=false) String content, @RequestParam(value = "searchkey", required=false) String searchKey,
                                      @RequestParam(value = "searchcontent", required=false) String searchContent, @RequestParam(value = "use", required=false) Integer isUse,
                                      @RequestParam(value = "category", required=false) String category, @PathVariable(value = "userName", required=false) String userName,
                                      @RequestParam(value = "remarks", required=false) String remarks){

        Article article = new Article();
        article.setId(id);
        article.setTitle(title);
        article.setContent(content);
        article.setSearchKeyword(searchKey);
        article.setSearchContent(searchContent);
        article.setIsUse(isUse);
        article.setCategory(category);
        article.setUpdateBy(userName);
        article.setRemarks(remarks);
        articleService.updateArticle(article);

        return ResponeModel.ok();
    }

    /**
     * 通过id删除指定文章
     * @param id
     * @return
     */
    @PostMapping(value = "/admin/{userName}/deletearticle.do")
    public ResponeModel deletArticle(@RequestParam(value = "id") String id){
        articleService.deleteArticle(id);
        return ResponeModel.ok();
    }

    /*-------------------------- public --------------------------*/

    /**
     * 通过分类id查询对应的文章
     * @param category
     * @return
     */
    @PostMapping(value = "/public/getArticleByCategory.do")
    public ResponeModel getArticleByCategory(@RequestParam(value = "category") String category){
        return ResponeModel.ok(articleService.getArticleMsgByCategory(category));
    }

    /**
     * 获取所有分类信息
     * @return 分类id和名称
     */
    @PostMapping(value = "/public/getCategory.do")
    public ResponeModel getCatagory(){
        return ResponeModel.ok(categoryService.getCategory());
    }

    /**
     * 获取指定文章的所有信息
     * @param id
     * @return
     */
    @PostMapping(value = "/public/getArticleMsg.do")
    public ResponeModel getArticleMsg(@RequestParam(value = "id") String id){
        return ResponeModel.ok(articleService.getArticleAllMsgById(id));
    }

    /**
     * 更新文章读取数量
     * @param id
     */
    @PostMapping(value = "/public/addClick.do")
    public void updateClick(@RequestParam(value = "id") String id){
        articleService.updateClick(id);
    }

}

