package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户->机构关联
 * </p>
 *
 * @author Matt
 */
@Schema(description = "用户->机构关联")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_user_org")
public class UserOrg extends BaseEntity {
    /**
     * 用户id
     */
    @TableField(value = "user_id")
    @Schema(description = "用户id")
    private String userId;

    /**
     * 机构id
     */
    @TableField(value = "org_id")
    @Schema(description = "机构id")
    private String orgId;

}