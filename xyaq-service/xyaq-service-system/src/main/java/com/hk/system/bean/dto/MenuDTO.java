package com.hk.system.bean.dto;

import com.hk.framework.enums.YesOrNo;
import com.hk.system.bean.enums.MenuType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 菜单入参
 * </p>
 *
 * @author Matt
 */
@Schema(description = "菜单入参")
@Data
public class MenuDTO {

    /**
     * 菜单名称
     */
    @Schema(description = "菜单名称")
    private String menuName;

    /**
     * 父菜单ID
     */
    @Schema(description = "父菜单ID")
    private String parentId;

    /**
     * 显示顺序
     */
    @Schema(description = "显示顺序")
    private Integer orderNum;

    /**
     * 路由地址
     */
    @Schema(description = "路由地址")
    private String path;

    /**
     * 组件路径
     */
    @Schema(description = "组件路径")
    private String component;

    /**
     * 菜单类型（0-目录;1-页面;2-按钮）
     */
    @Schema(description = "菜单类型（0目录;1页面;2按钮）")
    private MenuType menuType;

    /**
     * 是否内嵌(0-否;1-是)
     */
    @Schema(description = "是否内嵌(0-否;1-是),")
    private YesOrNo isIframe;

    /**
     * 是否为外链
     */
    @Schema(description = "是否为外链")
    private YesOrNo isLink;
    /**
     * 地址
     */
    @Schema(description = "地址")
    private String link;

    /**
     * 菜单是否显示
     */
    @Schema(description = "菜单是否显示")
    private Boolean isHide;

    /**
     * 是否缓存
     */
    @Schema(description = "是否缓存")
    private YesOrNo isKeepAlive;

    /**
     * 权限标识
     */
    @Schema(description = "权限标识")
    private String perms;

    /**
     * 菜单图标
     */
    @Schema(description = "菜单图标")
    private String icon;

    /**
     * 菜单是否启用（0-否;1-是）
     */
    @Schema(description = "菜单是否启用（0-否;1-是）")
    private YesOrNo enable;

}