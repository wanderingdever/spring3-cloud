package com.easy.system.bean.dto.role;

import com.easy.system.bean.enums.AuthorityLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

/**
 * 角色信息
 *
 * @author Matt
 */
@Data
@Schema(description = "角色入参")
public class RoleDTO {

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
    private Boolean enable;

    @Schema(description = "菜单ID数组")
    private List<String> menuIds;

}