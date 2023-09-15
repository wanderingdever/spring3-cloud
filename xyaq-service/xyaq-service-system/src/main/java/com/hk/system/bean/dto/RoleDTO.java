package com.hk.system.bean.dto;

import com.hk.framework.enums.YesOrNo;
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

    /**
     * 角色名称
     */
    @Schema(description = "角色名称")
    private String roleName;

    /**
     * 角色权限字符串
     */
    @Schema(description = "角色权限字表示")
    private String roleKey;

    /**
     * 显示顺序
     */
    @Schema(description = "显示顺序")
    private Integer roleSort;

    /**
     * 是否启用（0停用;1正常）
     */
    @Schema(description = "是否启用（0停用;1正常）")
    private YesOrNo enable;

    /**
     * 菜单ID数组
     */
    @Schema(description = "菜单ID数组")
    private List<String> menuIds;
}