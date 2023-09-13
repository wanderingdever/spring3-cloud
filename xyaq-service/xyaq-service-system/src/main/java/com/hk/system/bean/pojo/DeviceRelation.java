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
@TableName(value = "xyaq_device_relation")
public class DeviceRelation extends BaseEntity {
    /**
     * 设备id
     */
    @TableField(value = "device_id")
    @Schema(description = "设备id")
    private String deviceId;

    /**
     * 挂载的设备id
     */
    @TableField(value = "mounted_device_id")
    @Schema(description = "挂载的设备id")
    private String mountedDeviceId;

}