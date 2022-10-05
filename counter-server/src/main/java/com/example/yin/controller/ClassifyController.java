package com.example.yin.controller;

import com.example.yin.config.common.SuccessMessage;
import com.example.yin.domain.Classify;
import com.example.yin.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ClassifyController {
    @Autowired
    ClassifyService classifyService;

    @GetMapping("/classify")
    public Object getAllClassify() {
        return new SuccessMessage<List<Classify>>(null, classifyService.selectAllClassify()).getMessage();
    }
}
