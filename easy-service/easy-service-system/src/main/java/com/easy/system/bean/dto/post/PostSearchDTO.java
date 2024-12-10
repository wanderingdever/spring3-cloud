package com.easy.system.bean.dto.post;

import com.easy.datasource.bean.dto.PageDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 岗位查询/分页入参
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "岗位名称查询/分页入参")
public class PostSearchDTO extends PageDTO {

    @Schema(description = "岗位名称")
    private String postName;

    @Schema(description = "岗位编码")
    private String postCode;

    @Schema(description = "是否轮岗")
    private String isRotation;

    @Schema(description = "是否启用")
    private Boolean enable;
}