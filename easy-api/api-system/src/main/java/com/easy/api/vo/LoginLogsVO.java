package com.easy.api.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 登录日志
 * </p>
 *
 * @author Matt
 */
@Schema(description = "登录日志")
@Data
public class LoginLogsVO implements Serializable {

    @Schema(description = "账号ID")
    private String userId;

    @Schema(description = "账号名称")
    private String userName;

    @Schema(description = "ip")
    private String ip;

    @Schema(description = "浏览器")
    private String browser;

    @Schema(description = "登录系统")
    private String os;

    @Schema(description = "IP归属")
    private String ipLocation;

    @Schema(description = "登录时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String loginTime;
}