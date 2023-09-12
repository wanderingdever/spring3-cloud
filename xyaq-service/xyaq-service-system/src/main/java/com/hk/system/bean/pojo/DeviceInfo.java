package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.entity.BaseEntity;
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
    /**
     * 位置id
     */
    @TableField(value = "device_location_id")
    @Schema(description = "位置id")
    private String deviceLocationId;

    /**
     * 设备类型
     */
    @TableField(value = "`type`")
    @Schema(description = "设备类型")
    private String type;

    /**
     * 设备code
     */
    @TableField(value = "code")
    @Schema(description = "设备code")
    private String code;

    /**
     * 设备名称
     */
    @TableField(value = "`name`")
    @Schema(description = "设备名称")
    private String name;

    /**
     * 经度
     */
    @TableField(value = "longitude")
    @Schema(description = "经度")
    private String longitude;

    /**
     * 纬度
     */
    @TableField(value = "latitude")
    @Schema(description = "纬度")
    private String latitude;

    /**
     * 设备ip
     */
    @TableField(value = "ip")
    @Schema(description = "设备ip")
    private String ip;

    /**
     * 设备账号
     */
    @TableField(value = "account")
    @Schema(description = "设备账号")
    private String account;

    /**
     * 设备密码
     */
    @TableField(value = "`password`")
    @Schema(description = "设备密码")
    private String password;
}