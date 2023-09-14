package com.hk.system.controller;

import cn.dev33.satoken.stp.StpUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试接口
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/test")
@Tag(name = "测试接口")
public class TestController {

    @PostMapping(value = "/saTokenTest")
    @Operation(description = "测试sa-token")
    public String test() {
        StpUtil.getRoleList();
        return StpUtil.getLoginId().toString();
    }
}