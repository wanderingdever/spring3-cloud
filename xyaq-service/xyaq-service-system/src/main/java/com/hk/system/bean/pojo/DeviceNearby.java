package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Schema(description = "设备周边关系表")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_device_nearby")
public class DeviceNearby extends BaseEntity {

    @TableField(value = "device_id")
    @Schema(description = "设备id")
    private String deviceId;

    @TableField(value = "nearby_device_id")
    @Schema(description = "周边设备id")
    private String nearbyDeviceId;
}