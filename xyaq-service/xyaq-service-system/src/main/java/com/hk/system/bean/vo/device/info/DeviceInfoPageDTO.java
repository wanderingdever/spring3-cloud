package com.hk.system.bean.vo.device.info;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备信息-分页-请求参数")
public class DeviceInfoPageDTO {

    @NotBlank(message = "设备id" + "不能为空")
    @Schema(title = "设备id")
    private String deviceId;

    @NotBlank(message = "区域id" + "不能为空")
    @Schema(title = "区域id")
    private String locationId;
}