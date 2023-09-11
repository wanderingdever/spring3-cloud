package com.hk.auth.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/test")
public class TestController {

    @GetMapping("/one")
    public String test() {
        return "test";
    }
}