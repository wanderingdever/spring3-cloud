package com.hk.system.bean.enums;


import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 用户类型
 * </p>
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum UserType {
    /**
     * 用户类型
     */
    WORKERS("WORKERS", "职工"),
    TEACHER("TEACHER", "教师"),
    ;
    @EnumValue
    private final String value;

    private final String desc;

}