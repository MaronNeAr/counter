package com.example.yin.service;
import com.example.yin.dao.ContestMapper;
import com.example.yin.domain.Contest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContestService {
    @Autowired
    ContestMapper contestMapper;

    public List<Contest> selectAllContest() {
        return contestMapper.selectAllContest();
    }
}
