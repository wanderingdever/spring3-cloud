package com.easy.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.core.bean.base.BaseEntity;
import com.easy.core.enums.AccountClient;
import com.easy.core.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 账号信息
 * </p>
 *
 * @author Matt
 */
@Schema(description = "账号信息")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_user")
public class User extends BaseEntity {

    @TableField(value = "username")
    @Schema(description = "账号")
    private String username;

    @TableField(value = "`password`")
    @Schema(description = "密码")
    private String password;

    @TableField(value = "email")
    @Schema(description = "邮箱")
    private String email;

    @TableField(value = "phone")
    @Schema(description = "手机号")
    private String phone;

    @TableField(value = "client")
    @Schema(description = "所属客户端")
    private AccountClient client;

    @TableField(value = "`status`")
    @Schema(description = "账号状态")
    private AccountStatus status;
}