package com.hk.system.bean.vo.device.info;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备信息-分页-响应参数")
public class DeviceInfoPageVO {

    @Schema(title = "设备id")
    private String deviceId;

    @Schema(title = "区域id")
    private String locationId;
}