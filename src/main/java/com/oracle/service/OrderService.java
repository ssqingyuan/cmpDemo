package com.oracle.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.CodeMapper;
import com.oracle.dao.OrderMapper;
import com.oracle.vo.Code;
import com.oracle.vo.Order;

@Service
public class OrderService {

	@Autowired
	OrderMapper dao;
	
	@Transactional
	public Order getOrderByorderid(Integer orderid) {
		return dao.getOrderByorderid(orderid);
	}
	
	@Transactional
	public Order selectByPrimaryKey(Integer orderid) {
		return dao.selectByPrimaryKey(orderid);
	}
	
	
	@Transactional
	public List<Order> getAll(){
		return dao.getAll();
	}
	
	@Transactional
	public void deleteByPrimaryKey(Integer orderid) {
		dao.deleteByPrimaryKey(orderid);
	}
	
	@Transactional
	public void updateByorederid(Integer orderid) {
		dao.updateByorederid(orderid);
	}
	
	@Transactional
	public void updateByorederid2(Integer orderid) {
		dao.updateByorederid2(orderid);
	}
	
	@Transactional
	public void updateByorederid3(Integer orderid) {
		dao.updateByorederid3(orderid);
	}
	
	@Transactional
	public void insert(Order record) {
		dao.insert(record);
	}
	
	@Transactional
	public Integer getorderidByordercode(String ordercode) {
		return dao.getorderidByordercode(ordercode);
	}
	
	@Transactional
	public List<Order> getOrderByOrderCodeorflag(String ordercode,String orderflag,String orderdate){
		return dao.getOrderByOrderCodeorflag(ordercode,orderflag,orderdate);
	}
	
	@Transactional
	public List<Order> getOrderByOrderCodeorflag2(String ordercode,String orderflag,String orderdate){
		return dao.getOrderByOrderCodeorflag2(ordercode,orderflag,orderdate);
	}
	
	@Transactional
	public List<Order> getOrderByflag(String orderflag){
		return dao.getOrderByflag(orderflag);
	}
	
	@Transactional
	public List<Order> getOrderByflagor(String one,String two){
		return dao.getOrderByflagor(one, two);
	}
}
