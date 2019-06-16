package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.CodeMapper;
import com.oracle.vo.Code;

@Service
public class CodeService {

	@Autowired
	CodeMapper dao;
	
	@Transactional
	public Code selectByPrimaryKey(String code) {
		return dao.selectByPrimaryKey(code);
	}
	
	@Transactional
	public List<Code> getBytype(String type){
		return dao.getBytype(type);
	}
	
	@Transactional
	public Code getByname(String name) {
		return dao.getByname(name);
	}
}
