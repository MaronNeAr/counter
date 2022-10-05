package com.example.yin.service;

import com.example.yin.dao.ClassifyMapper;
import com.example.yin.dao.CommodityMapper;
import com.example.yin.domain.Classify;
import com.example.yin.domain.Commodity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityService {
    @Autowired
    CommodityMapper commodityMapper;

    public List<Commodity> selectCommoditiesByCid(Integer id) {
        return commodityMapper.selectCommoditiesByCid(id);
    }

    public List<Commodity> selectAllCommodities() {
        return commodityMapper.selectAllCommodities();
    }
}
