package com.oracle.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.dao.PartsMapper;

public class Test2 {

	ClassPathXmlApplicationContext c=new ClassPathXmlApplicationContext("applicationContext.xml");
	@Test
	public void test() {
		System.out.println("kjsbfh");
		PartsMapper dao=c.getBean(PartsMapper.class);
		System.out.println(dao.getNameandCount());
	}

}
