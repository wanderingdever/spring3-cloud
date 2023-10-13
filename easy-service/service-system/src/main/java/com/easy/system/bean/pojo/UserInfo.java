package com.easy.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.framework.bean.base.BaseEntity;
import com.easy.system.bean.enums.UserType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户基本信息
 * </p>
 *
 * @author Matt
 */
@Schema(description = "用户基本信息")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_user_info")
public class UserInfo extends BaseEntity {
    /**
     * 用户信息ID
     */
    @TableField(value = "user_id")
    @Schema(description = "用户信息ID")
    private String userId;


    /**
     * 昵称
     */
    @TableField(value = "nickname")
    @Schema(description = "昵称")
    private String nickname;


    /**
     * 头像
     */
    @TableField(value = "avatar")
    @Schema(description = "头像")
    private String avatar;

    /**
     * 姓名
     */
    @TableField(value = "`name`")
    @Schema(description = "姓名")
    private String name;

    /**
     * 身份证
     */
    @TableField(value = "id_card")
    @Schema(description = "身份证")
    private String idCard;

    /**
     * 性别
     */
    @TableField(value = "gender")
    @Schema(description = "性别")
    private String gender;

    /**
     * 人脸ID
     */
    @TableField(value = "face_id")
    @Schema(description = "人脸ID")
    private String faceId;

    /**
     * 用户类型
     */
    @TableField(value = "user_type")
    @Schema(description = "用户类型")
    private UserType userType;

    @TableField(value = "remark")
    @Schema(description = "备注")
    private String remark;
}