package com.easy.core.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 是否枚举
 *
 * @author Matt
 */
@Getter
@AllArgsConstructor
public enum FileType {

    /**
     * 否
     */
    PNG("png", "image/jpeg"),
    JPEG("jpeg", "image/jpeg"),
    JPG("jpg", "image/jpeg"),
    PDF("pdf", "pdf");

    @EnumValue
    private final String value;
    private final String desc;
}