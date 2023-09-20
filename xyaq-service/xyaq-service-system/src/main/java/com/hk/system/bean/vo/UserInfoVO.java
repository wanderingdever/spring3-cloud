package com.hk.system.bean.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.hk.framework.enums.AccountClient;
import com.hk.framework.enums.AccountStatus;
import com.hk.framework.enums.Gender;
import com.hk.system.bean.enums.UserType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 用户信息数据
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "用户信息")
public class UserInfoVO implements Serializable {

    /**
     * 主键ID
     */
    @Schema(description = "主键ID")
    private String id;

    /**
     * 账号
     */
    @Schema(description = "账号")
    private String username;

    /**
     * 手机号
     */
    @Schema(description = "手机号")
    private String phone;

    /**
     * 邮箱
     */
    @Schema(description = "邮箱")
    private String email;

    /**
     * 昵称
     */
    @Schema(description = "昵称")
    private String nickname;

    /**
     * 真实姓名
     */
    @Schema(description = "姓名")
    private String name;

    /**
     * 证件号码
     */
    @Schema(description = "证件号码")
    private String idCard;

    /**
     * 性别
     */
    @Schema(description = "性别")
    private Gender gender;

    /**
     * 头像
     */
    @Schema(description = "头像")
    private String avatar;

    /**
     * 创建时间
     */
    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String createTime;

    /**
     * 账号状态
     */
    @Schema(description = "账号状态")
    private AccountStatus status;

    /**
     * 账号客户端
     */
    @Schema(description = "账号客户端")
    private AccountClient client;

    /**
     * 用户类型
     */
    @TableField(value = "user_type")
    @Schema(description = "用户类型")
    private UserType userType;

    /**
     * 机构ID
     */
    @Schema(description = "机构id")
    private String orgId;

    /**
     * 角色列表
     */
    @Schema(description = "角色列表")
    private List<String> roles;

    /**
     * 角色列表
     */
    @Schema(description = "权限列表")
    private List<String> permissions;

    /**
     * 岗位
     */
    @Schema(description = "岗位")
    private List<String> posts;
}