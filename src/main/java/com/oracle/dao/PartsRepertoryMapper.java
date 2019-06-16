package com.oracle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oracle.vo.PartsRep;
import com.oracle.vo.PartsRepertory;
@Repository
public interface PartsRepertoryMapper {
    int deleteByPrimaryKey(Integer partsrepid);

    void deleteByPartsid(Integer partsid);
    
    int insert(PartsRepertory record);

    int insertSelective(PartsRepertory record);

    PartsRepertory selectByPrimaryKey(Integer partsrepid);

    int updateByPrimaryKeySelective(PartsRepertory record);

    int updateByPrimaryKey(PartsRepertory record);
    
    List<PartsRep> getAll();
    
    List<PartsRep> getnumByname(@Param("name") String name);
    
    List<PartsRep> getnumByid(@Param("id") Integer id);
    
    PartsRep getPartRepByname(String name);
    
    void updatenumByid(@Param("partsid") Integer partsid,@Param("num") Integer num);
    
    void updatenumByid2(@Param("partsid") Integer partsid,@Param("num") Integer num);
}