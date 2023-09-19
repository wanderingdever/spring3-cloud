package com.hk.system.bean.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 数据权限级别
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum AuthorityLevel {

    /**
     * 菜单类型
     */
    ONESELF("ONESELF", "本级"),
    LOWER("LOWER", "本级及下级");

    @EnumValue
    private final String value;

    private final String desc;
}