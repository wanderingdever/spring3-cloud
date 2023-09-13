package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 菜单权限信息
 * </p>
 *
 * @author Matt
 */
@Schema(description = "菜单权限信息")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_menu")
public class Menu extends BaseEntity {
    /**
     * 菜单名称
     */
    @TableField(value = "menu_name")
    @Schema(description = "菜单名称")
    private String menuName;

    /**
     * 父菜单ID
     */
    @TableField(value = "parent_id")
    @Schema(description = "父菜单ID")
    private String parentId;

    /**
     * 显示顺序
     */
    @TableField(value = "order_num")
    @Schema(description = "显示顺序")
    private Integer orderNum;

    /**
     * 路由地址
     */
    @TableField(value = "`path`")
    @Schema(description = "路由地址")
    private String path;

    /**
     * 组件路径
     */
    @TableField(value = "component")
    @Schema(description = "组件路径")
    private String component;

    /**
     * 是否为外链
     */
    @TableField(value = "is_frame")
    @Schema(description = "是否为外链")
    private String isFrame;

    /**
     * 菜单类型
     */
    @TableField(value = "menu_type")
    @Schema(description = "菜单类型")
    private String menuType;

    /**
     * 菜单是否显示
     */
    @TableField(value = "`show`")
    @Schema(description = "菜单是否显示")
    private String show;

    /**
     * 权限标识
     */
    @TableField(value = "perms")
    @Schema(description = "权限标识")
    private String perms;

    /**
     * 菜单图标
     */
    @TableField(value = "icon")
    @Schema(description = "菜单图标")
    private String icon;

    /**
     * 是否启用
     */
    @TableField(value = "`enable`")
    @Schema(description = "是否启用")
    private String enable;


}