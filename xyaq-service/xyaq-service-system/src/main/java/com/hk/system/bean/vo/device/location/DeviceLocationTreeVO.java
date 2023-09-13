package com.hk.system.bean.vo.device.location;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;

@Schema(description = "区域树查询-响应参数")
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

    @Schema(description = "地点名称简称")
    private String shortName;

    @Schema(description = "标签")
    private List<String> labelList;

    @Schema(description = "经度")
    private String longitude;

    @Schema(description = "纬度")
    private String latitude;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "下级")
    private List<DeviceLocationTreeVO> children;
}