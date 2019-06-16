package com.oracle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.PartsMapper;
import com.oracle.dao.PartsRepBillMapper;
import com.oracle.dao.PartsRepertoryMapper;
import com.oracle.vo.PartsRep;
import com.oracle.vo.PartsRepertory;

@Service
public class PartsRepertoryService {

	@Autowired
	PartsRepertoryMapper dao;
	@Autowired
	PartsMapper pdao;
	
	@Transactional
	public void deleteByPartsid(Integer partsid) {
		dao.deleteByPartsid(partsid);
	}
	
	@Transactional
	public List<PartsRep> getAll(){
		return dao.getAll();
	}
	@Transactional
	public List<PartsRep> getnumByid(Integer id){
		return dao.getnumByid(id);
	}
	@Transactional
	public List<PartsRep> getnumByname(String name){
		return dao.getnumByname(name);
	}
	
	@Transactional
	public PartsRep getPartRepByname(String name) {
		return dao.getPartRepByname(name);
	}
	
	@Transactional
	public void updatenumByid(Integer partsid,Integer num) {
		 dao.updatenumByid(partsid, num);
	}
	
	@Transactional
	public void updatenumByid2(Integer partsid,Integer num) {
		 dao.updatenumByid2(partsid, num);
	}

}
