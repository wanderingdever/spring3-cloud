package com.hk.system.bean.dto.post;

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

    @Schema(description = "岗位名称")
    private String postName;

    @Schema(description = "岗位编码")
    private String postCode;

    @Schema(description = "显示顺序")
    private Integer postSort;

    @Schema(description = "是否轮岗")
    private String isRotation;

    @Schema(description = "是否启用")
    private Boolean enable;

    @Schema(description = "备注")
    private String remark;
}