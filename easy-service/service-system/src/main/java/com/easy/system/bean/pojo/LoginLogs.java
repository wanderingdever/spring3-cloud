package com.easy.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.framework.bean.base.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 登录日志
 * </p>
 *
 * @author Matt
 */
@Schema(description = "登录日志")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_login_logs")
public class LoginLogs extends BaseEntity {

    @TableField(value = "user_id")
    @Schema(description = "账号ID")
    private String userId;

    @TableField(value = "username")
    @Schema(description = "账号名称")
    private String userName;

    @TableField(value = "ip")
    @Schema(description = "ip")
    private String ip;

    @TableField(value = "browser")
    @Schema(description = "浏览器")
    private String browser;

    @TableField(value = "ip_location")
    @Schema(description = "IP归属")
    private String ipLocation;

    @TableField(value = "login_time")
    @Schema(description = "登录时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String loginTime;
}