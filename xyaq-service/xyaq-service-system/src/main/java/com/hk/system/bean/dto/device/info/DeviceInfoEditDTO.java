package com.hk.system.bean.dto.device.info;

import com.hk.system.bean.enums.DeviceTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备信息-编辑-请求参数")
public class DeviceInfoEditDTO {

    @Pattern(regexp = "\\d.*", message = "主键ID只能为数字")
    @NotBlank(message = "id" + "不能为空")
    @Schema(description = "主键ID")
    private String id;

    @Pattern(regexp = "\\d.*", message = "id只能为数字")
    @Schema(title = "组织id")
    private String orgId;

    @Pattern(regexp = "\\d.*", message = "id只能为数字")
    @Schema(description = "位置id")
    private String deviceLocationId;

    /**
     * {@link DeviceTypeEnum DeviceTypeEnum}
     */
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

    @Pattern(regexp = "[01]", message = "0：接入；1：不接入")
    @Schema(description = "是否接入国标平台 0：接入；1：不接入")
    private String LinkGbPlatform;

    @Size(max = 300, message = "备注只能在 0-300 之间")
    @Schema(description = "备注")
    private String remark;

    @Pattern(regexp = "\\d.*", message = "排序只能为数字")
    @Schema(description = "排序")
    private String sort;

    @Pattern(regexp = "[01]", message = "0：启用；1：不启用")
    @Schema(description = "是否启用")
    private String del;

    public String getLabel() {
        return CollectionUtils.isEmpty(labelList) ? "" : String.join(",", labelList);
    }
}