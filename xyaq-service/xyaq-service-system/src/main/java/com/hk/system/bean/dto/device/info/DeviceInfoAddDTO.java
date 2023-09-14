package com.hk.system.bean.dto.device.info;

import com.hk.system.bean.enums.DeviceTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备信息-新增-请求参数")
public class DeviceInfoAddDTO {

    @NotBlank(message = "组织id" + "不能为空")
    @Schema(title = "组织id")
    private String orgId;

    @NotBlank(message = "请选择位置")
    @Schema(description = "位置id")
    private String deviceLocationId;

    /**
     * {@link DeviceTypeEnum DeviceTypeEnum}
     */
    @NotBlank(message = "请选择" + "设备类型")
    @Schema(title = "设备类型")
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

    @Schema(description = "设备密码")
    private String password;

    @Schema(description = "是否接入国标平台 0：接入；1：不接入")
    private Integer LinkGbPlatform;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "排序")
    private Integer sort;
}