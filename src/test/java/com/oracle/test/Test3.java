package com.oracle.test;

import com.oracle.dao.EmpMapper;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Test3 {

    ClassPathXmlApplicationContext c=new ClassPathXmlApplicationContext("applicationContext.xml");

    @Test
    public void Test(){
        EmpMapper dao=c.getBean(EmpMapper.class);
        System.out.println(dao.selectByPrimaryKey(2).getName());


    }

}

