package com.example.yin.dao;

import com.example.yin.domain.Classify;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassifyMapper {
    List<Classify> selectAllClassify();
}
