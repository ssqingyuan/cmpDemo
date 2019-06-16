package com.oracle.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oracle.vo.Parts;
@Repository
public interface PartsMapper {
    int deleteByPrimaryKey(Integer partsid);

    int insert(Parts record);

    int insertSelective(Parts record);

    Parts selectByPrimaryKey(Integer partsid);

    void updateByPrimaryKeySelective(Parts record);

    void updateByPrimaryKey(Parts record);
    
    List<Parts> getAll();
    
    List<Parts> getPartsBypartsname(String partsname);
    
    String getPartsnameBypartsid(Integer partsid);
    
    Parts getBypartsname(String partsname);
    
    List<Map<String,Object>> getNameandCount();
    
    Map<String,Object> getNameandCountBypartsid(Integer partsid);
}