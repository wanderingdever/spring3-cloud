package com.hk.system.bean.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 岗位信息
 *
 * @author Matt
 */
@Data
@Schema(description = "岗位信息入参")
public class PostDTO {

    /**
     * 岗位编码
     */
    @Schema(description = "岗位编码")
    private String postCode;

    /**
     * 岗位名称
     */
    @Schema(description = "岗位名称")
    private String postName;

    /**
     * 显示顺序
     */
    @Schema(description = "显示顺序")
    private Integer postSort;

    /**
     * 是否启用
     */
    @Schema(description = "是否启用")
    private Boolean enable;
}