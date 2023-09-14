package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 设备地点信息表
 * </p>
 *
 * @author Matt
 */
@Schema(description = "设备地点信息表")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_device_info")
public class DeviceInfo extends BaseEntity {

    @TableField(value = "org_id")
    @Schema(description = "所属组织id")
    private String orgId;

    @TableField(value = "device_location_id")
    @Schema(description = "位置id")
    private String deviceLocationId;

    @TableField(value = "`type`")
    @Schema(description = "设备类型")
    private String type;

    @TableField(value = "code")
    @Schema(description = "设备code")
    private String code;

    @TableField(value = "`name`")
    @Schema(description = "设备名称")
    private String name;

    @TableField(value = "`short_name`")
    @Schema(description = "设备名称简称")
    private String shortName;

    @TableField(value = "brand")
    @Schema(description = "品牌")
    private String brand;

    @TableField(value = "`label`")
    @Schema(description = "标签")
    private String label;

    @TableField(value = "longitude")
    @Schema(description = "经度")
    private String longitude;

    @TableField(value = "latitude")
    @Schema(description = "纬度")
    private String latitude;

    @TableField(value = "ip")
    @Schema(description = "设备ip")
    private String ip;

    @TableField(value = "identification")
    @Schema(description = "设备标识")
    private String identification;

    @TableField(value = "account")
    @Schema(description = "设备账号")
    private String account;

    @TableField(value = "`password`")
    @Schema(description = "设备密码")
    private String password;

    @TableField(value = "link_gb_platform")
    @Schema(description = "是否接入国标平台 0：接入；1：不接入")
    private Integer LinkGbPlatform;

    @TableField(value = "remark")
    @Schema(description = "备注")
    private String remark;

    @TableField(value = "sort")
    @Schema(description = "排序")
    private Integer sort;
}