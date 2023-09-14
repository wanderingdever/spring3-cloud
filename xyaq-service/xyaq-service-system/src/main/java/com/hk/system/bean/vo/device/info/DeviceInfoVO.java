package com.hk.system.bean.vo.device.info;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备信息-分页-响应参数")
public class DeviceInfoVO {

    @Schema(description = "所属组织id")
    private String orgId;

    @Schema(description = "位置id")
    private String deviceLocationId;

    @Schema(description = "设备类型")
    private String type;

    @Schema(description = "设备code")
    private String code;

    @Schema(description = "设备名称")
    private String name;

    @Schema(description = "设备名称简称")
    private String shortName;

    @Schema(description = "品牌")
    private String brand;

    @Schema(description = "标签")
    private List<String> labelList;

    @Schema(description = "经度")
    private String longitude;

    @Schema(description = "纬度")
    private String latitude;

    @Schema(description = "设备ip")
    private String ip;

    @Schema(description = "设备标识")
    private String identification;

    @Schema(description = "设备账号")
    private String account;

    @Schema(description = "是否接入国标平台 0：接入；1：不接入")
    private Integer LinkGbPlatform;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "排序")
    private Integer sort;
}