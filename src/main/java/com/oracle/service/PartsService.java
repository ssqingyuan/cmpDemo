package com.oracle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.PartsMapper;
import com.oracle.vo.Parts;

@Service
public class PartsService {

	@Autowired
	PartsMapper dao;
	
	@Transactional
	public List<Map<String,Object>> getNameandCount(){
		return dao.getNameandCount();
	}
	
	@Transactional
	public Map<String,Object> getNameandCountBypartsid(Integer partsid){
		return dao.getNameandCountBypartsid(partsid);
	}
	
	@Transactional
	public void updateByPrimaryKeySelective(Parts record) {
		dao.updateByPrimaryKeySelective(record);
	}
	
	@Transactional
	public  List<Parts> getPartsBypartsname(String partsname) {
		return dao.getPartsBypartsname(partsname);
	}
	
	
	@Transactional
	public void saveParts(Parts record) {
		dao.insert(record);
	}
	@Transactional
	public void partdelete(Integer partsid) {
		dao.deleteByPrimaryKey(partsid);
	}
	@Transactional
	public List<Parts> getAll(){
		return dao.getAll();
	}
	
	@Transactional
	public Parts selectByPrimaryKey(Integer partsid) {
		return dao.selectByPrimaryKey(partsid);
	}
	
	@Transactional
	public Parts getBypartsname(String partsname) {
		return dao.getBypartsname(partsname);
	}
	
	
}
