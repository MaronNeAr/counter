package com.example.yin.service;

import com.example.yin.dao.ClassifyMapper;
import com.example.yin.domain.Classify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassifyService {
    @Autowired
    ClassifyMapper classifyMapper;

    public List<Classify> selectAllClassify() {
        return classifyMapper.selectAllClassify();
    }
}
