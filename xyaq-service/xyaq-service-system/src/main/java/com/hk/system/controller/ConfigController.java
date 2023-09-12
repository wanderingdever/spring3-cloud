package com.hk.system.controller;

import com.hk.system.service.ConfigService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 参数配置
 * <p>
 * 2022/1/13 18:05
 *
 * @author Matt
 */
@RestController
@RequestMapping("/config")
@Tag(name = "参数配置")
public class ConfigController {

    private final ConfigService configService;

    public ConfigController(ConfigService configService) {
        this.configService = configService;
    }

}