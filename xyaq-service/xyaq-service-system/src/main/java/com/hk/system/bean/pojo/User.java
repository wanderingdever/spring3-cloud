package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.bean.base.BaseEntity;
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
@TableName(value = "xyaq_user")
public class User extends BaseEntity {
    /**
     * 账号
     */
    @TableField(value = "username")
    @Schema(description = "账号")
    private String username;

    /**
     * 密码
     */
    @TableField(value = "`password`")
    @Schema(description = "密码")
    private String password;

    /**
     * 邮箱
     */
    @TableField(value = "email")
    @Schema(description = "邮箱")
    private String email;

    /**
     * 手机号
     */
    @TableField(value = "phone")
    @Schema(description = "手机号")
    private String phone;

    /**
     * 所属客户端
     */
    @TableField(value = "client")
    @Schema(description = "所属客户端")
    private String client;

    /**
     * 排序
     */
    @TableField(value = "sort")
    @Schema(description = "排序")
    private Integer sort;

    /**
     * 账号状态
     */
    @TableField(value = "`status`")
    @Schema(description = "账号状态")
    private String status;


}