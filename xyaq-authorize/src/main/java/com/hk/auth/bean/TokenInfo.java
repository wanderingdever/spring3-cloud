package com.hk.auth.bean;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 登录信息
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(title = "登录信息")
public class TokenInfo implements Serializable {

    @Schema(name = "token")
    private String accessToken;

    @Schema(name = "过期时间")
    private String timeOut;

    @Schema(name = "设备信息")
    private String device;
}