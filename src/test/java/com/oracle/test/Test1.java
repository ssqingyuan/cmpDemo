package com.oracle.test;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.dao.PartsMapper;
import com.oracle.dao.PartsRepBillMapper;
import com.oracle.dao.PartsRepertoryMapper;

public class Test1 {
	
	ClassPathXmlApplicationContext c=new ClassPathXmlApplicationContext("applicationContext.xml");
	

	@Test
	public void test() {
		PartsMapper dao=c.getBean(PartsMapper.class);
		System.out.println(dao.getNameandCount());
	}

}
