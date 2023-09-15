package com.hk.system.bean.dto.device.relation;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备关系-新增-请求参数")
public class DeviceRelationAddDTO {

    @Pattern(regexp = "\\d.*", message = "主键ID只能为数字")
    @NotBlank(message = "id" + "不能为空")
    @Schema(description = "设备id")
    private String deviceId;

    @Pattern(regexp = "\\d.*", message = "主键ID只能为数字")
    @NotBlank(message = "id" + "不能为空")
    @Schema(description = "挂载设备id")
    private String mountedDeviceId;

    @Schema(description = "摄像头通道")
    private String deviceChannel;
}