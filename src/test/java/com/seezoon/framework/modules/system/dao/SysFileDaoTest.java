package com.seezoon.framework.modules.system.dao;

import com.seezoon.framework.modules.system.cms.dao.CategoryDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.seezoon.framework.common.context.test.BaseJunitTest;

public class SysFileDaoTest extends BaseJunitTest{

	@Autowired
	//private SysFileDao sysFileDao;
	private CategoryDao categoryDao;

	@Test
	public void testDeleteByPrimaryKey() {
		//sysFileDao.deleteByPrimaryKey("1", null);
		System.out.println(categoryDao.findAll());
	}

}
