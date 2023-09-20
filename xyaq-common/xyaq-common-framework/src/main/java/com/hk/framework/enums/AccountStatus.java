package com.hk.framework.enums;


import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 账号状态枚举
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum AccountStatus {
    /**
     * 账号状态
     */
    INACTIVATED(0, "未激活"),
    NORMAL(1, "正常"),
    STOP(9, "停用"),
    ;
    @EnumValue
    private final Integer value;

    private final String desc;

}