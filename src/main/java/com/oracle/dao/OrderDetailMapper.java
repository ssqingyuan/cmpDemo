package com.oracle.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.oracle.vo.OrderDetail;
@Repository
public interface OrderDetailMapper {
    void deleteByPrimaryKey(Integer orderdetailid);
    
    void deleteByPartsid(Integer partsid);
    
    void insert(OrderDetail record);

    int insertSelective(OrderDetail record);

    OrderDetail selectByPrimaryKey(Integer orderdetailid);

    int updateByPrimaryKeySelective(OrderDetail record);

    int updateByPrimaryKey(OrderDetail record);
    
    int getPrimaryKeyBypartsid(Integer partsid);
    
    void deleteByOrderid(Integer orderid);
    
    List<OrderDetail> getByorderid(Integer orderid);
    
    
}