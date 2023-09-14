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

    @TableField(value = "account")
    @Schema(description = "设备账号")
    private String account;

    @TableField(value = "`password`")
    @Schema(description = "设备密码")
    private String password;

    @TableField(value = "sort")
    @Schema(description = "排序")
    private Integer sort;
}