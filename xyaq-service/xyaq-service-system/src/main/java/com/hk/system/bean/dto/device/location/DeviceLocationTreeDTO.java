package com.hk.system.bean.dto.device.location;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "区域树查询-请求参数")
public class DeviceLocationTreeDTO {

    @Pattern(regexp = "\\d.*", message = "id只能为数字")
    @Schema(title = "组织id")
    private String orgId;
}