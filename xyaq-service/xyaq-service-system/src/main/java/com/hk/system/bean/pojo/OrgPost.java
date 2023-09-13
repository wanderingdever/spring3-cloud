package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 岗位->机构关联
 * </p>
 *
 * @author Matt
 */
@Schema(description = "岗位->机构关联")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_org_post")
public class OrgPost extends BaseEntity {
    /**
     * 机构ID
     */
    @TableField(value = "org_id")
    @Schema(description = "机构ID")
    private String orgId;

    /**
     * 岗位ID
     */
    @TableField(value = "post_id")
    @Schema(description = "岗位ID")
    private String postId;


}