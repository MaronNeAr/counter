package com.example.yin.controller;

import com.example.yin.config.common.SuccessMessage;
import com.example.yin.domain.Commodity;
import com.example.yin.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CommodityController {
    @Autowired
    CommodityService commodityService;

    @GetMapping("/goods/{id}")
    public Object getGoods(@PathVariable("id") Integer id) {
        return new SuccessMessage<List<Commodity>>(null, commodityService.selectCommoditiesByCid(id)).getMessage();
    }

    @GetMapping("/goods")
    public Object getGoods() {
        return new SuccessMessage<List<Commodity>>(null, commodityService.selectAllCommodities()).getMessage();
    }
}
