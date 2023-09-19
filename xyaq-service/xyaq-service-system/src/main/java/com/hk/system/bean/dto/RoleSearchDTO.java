package com.hk.system.bean.dto;

import com.hk.datasource.bean.dto.PageDTO;
import com.hk.framework.enums.YesOrNo;
import com.hk.system.bean.enums.AuthorityLevel;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色查询入参
 * </p>
 *
 * @author Matt
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(description = "角色查询入参")
public class RoleSearchDTO extends PageDTO {

    @Schema(description = "角色名字")
    private String roleName;

    /**
     * 角色权限字符串
     */
    @Schema(description = "角色权限字表示")
    private String roleKey;

    /**
     * 权限级别
     */
    @Schema(description = "权限级别")
    private AuthorityLevel authorityLevel;

    /**
     * 角色所属机构ID
     */
    @Schema(description = "角色所属机构ID")
    private String orgId;

    /**
     * 是否启用（0停用;1正常）
     */
    @Schema(description = "是否启用（0停用;1正常）")
    private YesOrNo enable;
}