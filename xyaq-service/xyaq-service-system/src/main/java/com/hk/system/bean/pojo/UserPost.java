package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户->岗位关联
 * </p>
 *
 * @author Matt
 */
@Schema(description = "用户->岗位关联")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_user_post")
public class UserPost extends BaseEntity {
    /**
     * 用户ID
     */
    @TableField(value = "user_id")
    @Schema(description = "用户ID")
    private String userId;

    /**
     * 岗位ID
     */
    @TableField(value = "post_id")
    @Schema(description = "岗位ID")
    private String postId;

}