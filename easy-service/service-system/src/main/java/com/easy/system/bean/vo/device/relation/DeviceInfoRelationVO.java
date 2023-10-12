package com.easy.system.bean.vo.device.relation;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备关系-列表-响应参数")
public class DeviceInfoRelationVO {

    @Schema(description = "主键ID")
    private String id;

    @Schema(description = "设备名称")
    private String name;

    @Schema(description = "设备名称简称")
    private String shortName;

    @Schema(description = "与该设备是否存在设备关系")
    private Boolean relation;

    @Schema(description = "通道号")
    private Boolean deviceChannel;
}