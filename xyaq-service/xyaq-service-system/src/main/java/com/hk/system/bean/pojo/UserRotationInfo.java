package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 人员轮值信息表
 * </p>
 *
 * @author Matt
 */
@Schema(description = "人员轮值信息表")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_user_rotation_info")
public class UserRotationInfo extends BaseEntity {
    /**
     * 岗位ID
     */
    @TableField(value = "post_id")
    @Schema(description = "岗位ID")
    private String postId;

    /**
     * 用户ID
     */
    @TableField(value = "user_id")
    @Schema(description = "用户ID")
    private String userId;

    /**
     * 排期配置ID
     */
    @TableField(value = "rotation_id")
    @Schema(description = "排期配置ID")
    private String rotationId;

    /**
     * 执行日期
     */
    @TableField(value = "execution_date")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "执行日期")
    private String executionDate;

}