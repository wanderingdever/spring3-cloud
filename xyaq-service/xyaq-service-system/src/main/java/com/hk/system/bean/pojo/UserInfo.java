package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.entity.BaseEntity;
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
@TableName(value = "xyaq_user_info")
public class UserInfo extends BaseEntity {
    /**
     * 用户信息ID
     */
    @TableField(value = "user_id")
    @Schema(description = "用户信息ID")
    private String userId;

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
    private String userType;

}