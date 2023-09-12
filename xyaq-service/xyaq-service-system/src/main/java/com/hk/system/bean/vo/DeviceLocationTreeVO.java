package com.hk.system.bean.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Schema(description = "设备地点信息表-响应参数")
@Data
public class DeviceLocationTreeVO {

    @Schema(description = "id")
    private String id;

    @Schema(description = "所属组织id")
    private String orgId;

    @Schema(description = "上级名称")
    private String parentId;

    @Schema(description = "地点名称")
    private String name;

    @Schema(description = "下级")
    private List<DeviceLocationTreeVO> children;
}