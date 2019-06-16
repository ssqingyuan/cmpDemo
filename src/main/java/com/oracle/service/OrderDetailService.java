package com.oracle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.OrderDetailMapper;
import com.oracle.vo.OrderDetail;

@Service
public class OrderDetailService {

	@Autowired
	OrderDetailMapper dao;
	
	
	@Transactional
	public void insert(OrderDetail record) {
		dao.insert(record);
	}
	
	@Transactional
	public void deleteByPrimaryKey(Integer orderdetailid) {
		dao.deleteByPrimaryKey(orderdetailid);
	}
	
	@Transactional
	public void deleteByPartsid(Integer partsid) {
		dao.deleteByPartsid(partsid);
	}
	
	@Transactional
	public void deleteByOrderid(Integer orderid) {
		dao.deleteByOrderid(orderid);
	}
	
	@Transactional
	public List<OrderDetail> getByorderid(Integer orderid){
		return dao.getByorderid(orderid);
	}
	
}
