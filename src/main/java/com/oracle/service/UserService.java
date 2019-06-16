package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.UserMapper;
import com.oracle.vo.User;

@Service
public class UserService {

	@Autowired
	UserMapper dao;
	
	@Transactional
	public User selectByPrimaryKey(Integer userid) {
	 return	dao.selectByPrimaryKey(userid);
	}
	
	@Transactional
	public User selectBynameandpwd(String name,String pwd) {
		return dao.selectBynameandpwd(name, pwd);
	}
	
}
