package com.hk.system.bean.dto.device.nearby;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "周边设备-新增-请求参数")
public class DeviceNearbyAddDTO {

    @Pattern(regexp = "\\d.*", message = "主键ID只能为数字")
    @NotBlank(message = "id" + "不能为空")
    @Schema(description = "主键ID")
    private String deviceId;

    @Schema(description = "待调整周边设备集合")
    private List<String> nearbyIdList;
}