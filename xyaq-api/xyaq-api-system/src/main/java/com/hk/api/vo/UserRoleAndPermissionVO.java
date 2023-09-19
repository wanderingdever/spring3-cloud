package com.hk.api.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * 用户角色和权限信息
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "用户角色和权限信息")
@AllArgsConstructor
public class UserRoleAndPermissionVO {

    @Schema(description = "用户角色")
    private List<String> roles;

    @Schema(description = "用户权限")
    private List<String> permissions;

}