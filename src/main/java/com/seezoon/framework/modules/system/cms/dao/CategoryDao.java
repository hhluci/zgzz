package com.seezoon.framework.modules.system.cms.dao;

import com.seezoon.framework.common.dao.CrudDao;
import com.seezoon.framework.modules.system.cms.entity.Category;

import java.util.List;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.cms
 * @Description: 文章分类Dao
 * @Date: Created in 9:04 2018/8/24
 */

public interface CategoryDao extends CrudDao<Category> {

    /**
     * 展示所有数据
     * @return
     */
    List<Category> findAll();

    /**
     * 获取所有分类信息
     * @return
     *
     * @return 分类id和名称
     */
    List<Category> findAllCategory();

    /**
     * 添加分类信息
     * @param category
     */
    void save(Category category);

    /**
     * 分类更新
     * @param category
     */
    void update(Category category);

    /**
     * 通过id删除分类
     * @param id
     */
    void delect(String id);

}
