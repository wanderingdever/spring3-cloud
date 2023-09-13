package com.hk.system.bean.enums;

import com.hk.utils.enums.EnumInterface;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DeviceTypeEnum implements EnumInterface<String> {

    /**
     * ?
     */
    AI_BOX("AI_BOX", "边缘计算盒子"),
    CAMERA("CAMERA", "摄像头"),
    ;

    private final String code;
    private final String introduction;
}