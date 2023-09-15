package com.hk.system.bean.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 菜单集合入参
 * </p>
 *
 * @author Matt
 */
@Schema(description = "菜单集合入参")
@Data
public class MenuListDTO {

    @Schema(description = "用户ID")
    private String userId;

    @Schema(description = "用户角色")
    private String roleKey;

    @Schema(description = "菜单名字")
    private String menuName;
}