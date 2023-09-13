package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 岗位轮值排班配置
 * </p>
 *
 * @author Matt
 */
@Schema(description = "岗位轮值排班配置")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_post_rotation_info")
public class PostRotationInfo extends BaseEntity {
    /**
     * 岗位ID
     */
    @TableField(value = "post_id")
    @Schema(description = "岗位ID")
    private String postId;

    /**
     * 轮值规则
     */
    @TableField(value = "rotation_rules")
    @Schema(description = "轮值规则")
    private String rotationRules;

    /**
     * 开始日期
     */
    @TableField(value = "start_date")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Schema(description = "开始日期")
    private String startDate;


}