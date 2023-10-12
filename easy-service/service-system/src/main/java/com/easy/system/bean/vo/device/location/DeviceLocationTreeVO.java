package com.easy.system.bean.vo.device.location;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Schema(description = "区域树-查询-响应参数")
@Data
public class DeviceLocationTreeVO extends DeviceLocationVO {

    @Schema(description = "下级")
    private List<DeviceLocationTreeVO> children;
}