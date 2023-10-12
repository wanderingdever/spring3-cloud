package com.easy.framework.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 账号客户端枚举
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum AccountClient {
    /**
     * 账号客户端枚举
     */
    WEB("WEB", "WEB"),
    APP("APP", "APP"),
    ;
    @EnumValue
    private final String value;

    private final String desc;
}