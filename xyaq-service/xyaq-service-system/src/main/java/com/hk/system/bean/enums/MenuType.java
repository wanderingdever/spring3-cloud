package com.hk.system.bean.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 菜单类型枚举
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum MenuType {

    /**
     * 菜单类型
     */
    MENU("MENU", "菜单"),
    BUTTON("BUTTON", "按钮");

    @EnumValue
    private final String value;

    private final String desc;
}