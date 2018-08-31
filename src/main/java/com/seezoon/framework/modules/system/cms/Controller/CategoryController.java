package com.seezoon.framework.modules.system.cms.Controller;

import com.seezoon.framework.common.context.beans.ResponeModel;
import com.seezoon.framework.common.web.BaseController;
import com.seezoon.framework.modules.system.cms.entity.Category;
import com.seezoon.framework.modules.system.cms.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms.Controller
 * @Description: 内容分类管理
 *               完善时添加@RequiresPermissions鉴权
 * @Date: Created in 13:42 2018/8/24
 */
@RestController
@RequestMapping(value = "/category/admin")
public class CategoryController extends BaseController {

    @Autowired
    private CategoryService categoryService;

    /**
     * 获取所有分类信息
     * @param pageNum
     * @param pageLimit
     * @return
     */
    @PostMapping(value = "/{userName}/list.do")
    public ResponeModel getAll(@RequestParam(value = "pagenum", defaultValue = "1") Integer pageNum,
                               @RequestParam(value = "pagelimit", defaultValue = "10") Integer pageLimit){

       return ResponeModel.ok(categoryService.getAll(pageNum, pageLimit));

    }

    /**
     * 获取分类信息中分类id和类名
     * @return
     */
    @PostMapping(value = "/{userName}/categorymsg.do")
    public ResponeModel getCategoryNameAndId(){
        return ResponeModel.ok(categoryService.getCategory());
    }

    /**
     * 添加分类
     * @param name
     * @param userName
     * @param use
     * @param orderNo
     * @return
     */
    @PostMapping(value = "/{userName}/add.do")
    public ResponeModel addCategory(@RequestParam(value = "name") @NotNull String name,
                                    @PathVariable(value = "userName") @NotNull String userName,
                                    @RequestParam(value = "use", defaultValue = "1") Integer use,
                                    @RequestParam(value = "orderno", defaultValue = "1") Integer orderNo){

        Category category = new Category();
        category.setName(name);
        category.setUse(use);
        category.setOrderNo(orderNo);
        category.setUpdateBy(userName);
        category.setCreateBy(userName);
        categoryService.save(category);

        return ResponeModel.ok();
    }

    /**
     * 修改已有分类
     * @param username
     * @param name
     * @param use
     * @param orderNO
     * @return
     */
    @PostMapping(value = "/{userName}/update.do")
    public ResponeModel updateCategory(@PathVariable(value = "userName") @NotNull String username,
                                       @RequestParam(value = "id") @NotNull String id,
                                       @RequestParam(value = "name", required = false) String name,
                                       @RequestParam(value = "use", required = false) Integer use,
                                       @RequestParam(value = "orderno", required = false) Integer orderNO){

        Category category = new Category();
        category.setId(id);
        category.setName(name);
        category.setUse(use);
        category.setOrderNo(orderNO);
        category.setUpdateBy(username);
        categoryService.updateMsg(category);

        return ResponeModel.ok();
    }

    /**
     * 通过id删除对应分类
     * @param id
     * @return
     */
    @PostMapping(value = "/{userName}/delete.do")
    public ResponeModel deleteCategory(@RequestParam(value = "id") @NotNull String id){
        categoryService.deleteMsg(id);
        return ResponeModel.ok();
    }

}
