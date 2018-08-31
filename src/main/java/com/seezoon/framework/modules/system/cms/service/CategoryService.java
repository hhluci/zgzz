package com.seezoon.framework.modules.system.cms.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.seezoon.framework.common.service.BaseService;
import com.seezoon.framework.common.service.CrudService;
import com.seezoon.framework.common.utils.DateUtils;
import com.seezoon.framework.common.utils.IdGen;
import com.seezoon.framework.modules.system.cms.dao.CategoryDao;
import com.seezoon.framework.modules.system.cms.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms.service
 * @Description: 分类事务
 * @Date: Created in 11:16 2018/8/24
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CategoryService extends BaseService {

    @Autowired
    private CategoryDao categoryDao;

    /**
     * 列出所有分类
     * @param pageNum
     * @param pageLimit
     * @return
     */
    @Transactional(readOnly = true)
    public PageInfo<Category> getAll(Integer pageNum, Integer pageLimit){

        PageHelper.startPage(pageNum, pageLimit);
        List<Category> content = categoryDao.findAll();

        return new PageInfo<>(content, pageLimit);
    }

    /**
     * 查询分类信息
     * @return 分类id和name
     */
    @Transactional(readOnly = true)
    public List<Category> getCategory(){
        return categoryDao.findAllCategory();
    }

    /**
     * 添加分类
     * @param category
     */
    public void save(Category category) {
        category.setId(IdGen.uuid());
        category.setCreateDate(new Date());
        category.setUpdateDate(category.getCreateDate());
        categoryDao.save(category);
    }

    /**
     * 更新数据
     *
     * @param category
     */
    public void updateMsg(Category category){
        category.setUpdateDate(new Date());
        categoryDao.update(category);
    }

    /**
     * 删除分类
     * @param id
     */
    public void deleteMsg(String id){
        categoryDao.delect(id);
    }

}
