package com.seezoon.framework.modules.system;

import com.seezoon.framework.common.context.test.BaseJunitTest;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.GregorianCalendar;
import java.util.Locale;

/**
 * @Author: yang
 * @ProjectName: seezoon-framework-all
 * @Package: com.seezoon.framework.modules.system
 * @Description:
 * @Date: Created in 15:04 2018/8/20
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "/spring-context.xml")
public class Messsage {

    ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

    MessageSource messageSource = (MessageSource) context.getBean("messageSource");

    public void test(){
        Object[] params = {"Jack", new GregorianCalendar().getTime()};
        System.out.println(messageSource.getMessage("welcome",params, Locale.CHINA));
        System.out.println(messageSource.getMessage("welcome",params, Locale.ENGLISH));
    }

}
