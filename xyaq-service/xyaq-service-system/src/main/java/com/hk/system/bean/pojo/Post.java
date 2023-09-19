package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 岗位信息
 * </p>
 *
 * @author Matt
 */
@Schema(description = "岗位信息")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_post")
public class Post extends BaseEntity {

    /**
     * 机构ID
     */
    @TableField(value = "org_id")
    @Schema(description = "机构ID")
    private String orgId;

    /**
     * 岗位编码
     */
    @TableField(value = "post_code")
    @Schema(description = "岗位编码")
    private String postCode;

    /**
     * 岗位名称
     */
    @TableField(value = "post_name")
    @Schema(description = "岗位名称")
    private String postName;

    /**
     * 显示顺序
     */
    @TableField(value = "post_sort")
    @Schema(description = "显示顺序")
    private Integer postSort;

    /**
     * 是否轮岗
     */
    @TableField(value = "is_rotation")
    @Schema(description = "是否轮岗")
    private String isRotation;

    /**
     * 是否启用
     */
    @TableField(value = "`enable`")
    @Schema(description = "是否启用")
    private String enable;


}