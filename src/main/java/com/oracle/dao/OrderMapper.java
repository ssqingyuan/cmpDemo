package com.oracle.dao;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.Order;
@Repository
public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderid);

    void insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    List<Order> getAll();
    	
    Order getOrderByorderid(Integer orderid);
    
    void updateByorederid(Integer orderid);
    
    void updateByorederid2(Integer orderid);
    
    void updateByorederid3(Integer orderid);
    
    Integer getorderidByordercode(String ordercode);
    
    List<Order> getOrderByOrderCodeorflag(@Param("ordercode") String ordercode,@Param("orderflag") String orderflag,@Param("orderdate") String orderdate);
    
    List<Order> getOrderByflag(String orderflag);
    
    List<Order> getOrderByflagor(@Param("one") String one,@Param("two") String two);
    
    List<Order> getOrderByOrderCodeorflag2(@Param("ordercode") String ordercode,@Param("orderflag") String orderflag,@Param("orderdate") String orderdate);
    
}