package com.easy.auth.bean;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 密码登录
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(title = "密码登录-入参")
public class PwdLogin {

    @Schema(title = "用户名")
    @NotBlank(message = "用户名不能为空")
    private String username;

    @Schema(title = "密码")
    @NotBlank(message = "密码不能为空")
    private String password;

    @Schema(title = "验证码")
    @NotBlank(message = "验证码不能为空")
    private String validateCode;

    @Schema(title = "验证码随机数")
    private String randomStr;

    @Schema(title = "设备信息")
    @NotBlank(message = "设备信息不能为空")
    private String device;
}