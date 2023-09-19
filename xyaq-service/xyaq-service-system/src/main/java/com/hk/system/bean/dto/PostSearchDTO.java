package com.hk.system.bean.dto;

import com.hk.datasource.bean.dto.PageDTO;
import com.hk.system.bean.enums.OrgTag;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 岗位查询/分页入参
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "岗位名称查询/分页入参")
public class PostSearchDTO extends PageDTO {

    @Schema(description = "机构标签")
    private List<OrgTag> orgTag;

    @Schema(description = "机构ID")
    private List<String> orgIdList;

    @Schema(description = "岗位名称")
    private String postName;

    @Schema(description = "岗位编码")
    private String postCode;

    @Schema(description = "是否启用")
    private Boolean enable;


}