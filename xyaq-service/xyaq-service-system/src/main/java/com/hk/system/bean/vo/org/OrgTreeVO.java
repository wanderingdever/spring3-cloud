package com.hk.system.bean.vo.org;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Data
@Schema(description = "组织树查询-响应参数")
public class OrgTreeVO {

    @Schema(description = "主键ID")
    private String id;

    @Schema(description = "上级id")
    private String orgParentId;

    @Schema(description = "组织名称")
    private String orgName;

    @Schema(description = "组织简称")
    private String orgShortName;

    @Schema(description = "下级")
    private List<OrgTreeVO> children;
}