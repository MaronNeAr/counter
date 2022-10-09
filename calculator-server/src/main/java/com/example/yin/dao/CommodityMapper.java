package com.example.yin.dao;

import com.example.yin.domain.Commodity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommodityMapper {
    List<Commodity> selectCommoditiesByCid(Integer id);

    List<Commodity> selectAllCommodities();
}
