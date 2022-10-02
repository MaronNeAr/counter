package com.example.yin.dao;

import com.example.yin.domain.Contest;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContestMapper {
    List<Contest> selectAllContest();
}