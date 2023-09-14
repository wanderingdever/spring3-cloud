package com.hk.system.bean.vo.device.location;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.util.List;

@Schema(description = "区域-挂载设备-请求参数")
@Data
public class DeviceLocationMountedDeviceDTO {

    @NotBlank(message = "请选择区域")
    @Schema(description = "区域id")
    private String locationId;

    @Schema(description = "挂载设备id集合")
    private List<String> deviceIdList;
}