package com.oracle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.PartsRepBillMapper;
import com.oracle.vo.PartsRepBill;

@Service
public class PartsRepBillService {

	@Autowired
	PartsRepBillMapper dao;
	
	@Transactional
	public List<Map<String,Object>> getAll(){
		return dao.getAll();
	}
	
	@Transactional
	public List<Map<String,Object>> getBymany(Map<String,Object> map){
		return dao.getBymany(map);
	}
	
	@Transactional
	public void insertPartsrepbill(PartsRepBill record) {
		dao.insert(record);
	}
	
	@Transactional
	public void deleteByPartsid(Integer partsid) {
		dao.deleteByPartsid(partsid);
	}
}
