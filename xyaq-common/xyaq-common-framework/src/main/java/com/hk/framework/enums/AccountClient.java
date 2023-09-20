package com.hk.framework.enums;

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
    WEB(0, "WEP"),
    APP(1, "APP"),
    ;
    @EnumValue
    private final Integer value;

    private final String desc;
}