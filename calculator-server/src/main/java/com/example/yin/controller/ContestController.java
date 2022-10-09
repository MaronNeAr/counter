package com.example.yin.controller;

import com.example.yin.config.common.SuccessMessage;
import com.example.yin.domain.Contest;
import com.example.yin.service.ContestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ContestController {
    @Autowired
    ContestService contestService;

    @GetMapping("/contest")
    public Object getAllContest() {
        return new SuccessMessage<List<Contest>>(null, contestService.selectAllContest()).getMessage();
    }
}
