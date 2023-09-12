package com.hk.system.bean.vo.device.location;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema(description = "区域树详情查询-响应参数")
@Data
public class DeviceLocationVO {

    @Schema(description = "id")
    private String id;

    @Schema(description = "所属组织id")
    private String orgId;

    @Schema(description = "上级名称")
    private String parentId;

    @Schema(description = "地点名称")
    private String name;
}