package com.seezoon.framework.modules.system.solr;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.GregorianCalendar;
import java.util.Locale;

import static org.junit.Assert.*;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system.solr
 * @Description:
 * @Date: Created in 16:24 2018/8/18
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "/spring-context.xml")
public class SolrServiceTest {

    @Test
    public void test1() {



    }



    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

        MessageSource messageSource = (MessageSource) context.getBean("customResource");
        Object[] params = {"Jack", new GregorianCalendar().getTime()};

        System.out.println(messageSource.getMessage("welcome", params, Locale.CHINA));
        System.out.println(messageSource.getMessage("welcome", params, Locale.ENGLISH));
    }

}