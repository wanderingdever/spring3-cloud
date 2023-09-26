package com.hk.system.bean.dto.role;

import com.hk.datasource.bean.dto.IdDTO;
import com.hk.framework.enums.YesOrNo;
import com.hk.system.bean.enums.AuthorityLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "角色编辑-请求参数")
public class RoleEditDTO extends IdDTO {

    @Schema(description = "角色名称")
    private String roleName;

    @Schema(description = "角色权限字表示")
    private String roleKey;

    @Schema(description = "权限级别")
    private AuthorityLevel authorityLevel;

    @Schema(description = "角色所属机构ID")
    private String orgId;

    @Schema(description = "显示顺序")
    private Integer roleSort;

    @Schema(description = "是否启用（0停用;1正常）")
    private YesOrNo enable;

    @Schema(description = "菜单ID数组")
    private List<String> menuIds;

    @Schema(description = "备注")
    private String remark;
}