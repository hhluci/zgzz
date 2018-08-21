package com.seezoon.framework.modules.system.solr;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Locale;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.solr
 * @Description:
 * @Date: Created in 16:24 2018/8/18
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "/spring-context.xml")
public class SolrServiceTest{

    @Test
    public void test1() {

        System.out.println(Locale.CHINA);

    }



    @Test
    public void test(){

    }


}