package com.hk.system.bean.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.Getter;

/**
 * 菜单类型枚举
 * </p>
 *
 * @author Matt
 */
@Getter
public enum MenuType {

    /**
     * 菜单类型
     */
    DIRECTORY(0, "目录"),
    PAGE(1, "页面"),
    BUTTON(2, "按钮");

    @EnumValue
    private final Integer value;

    private final String desc;

    MenuType(Integer value, String desc) {
        this.value = value;
        this.desc = desc;
    }
}