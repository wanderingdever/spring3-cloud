package com.hk.system.bean.vo.device.location;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "区域树查询-请求参数")
public class DeviceLocationTreeSearchVO {

    @Schema(title = "组织id")
    private String orgId;
}