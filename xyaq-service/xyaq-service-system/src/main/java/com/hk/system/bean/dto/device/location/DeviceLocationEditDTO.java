package com.hk.system.bean.dto.device.location;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.apache.commons.collections4.CollectionUtils;

import java.util.List;

@Schema(description = "区域-编辑-请求参数")
@Data
public class DeviceLocationEditDTO {

    @Pattern(regexp = "\\d.*", message = "主键ID只能为数字")
    @NotBlank(message = "id" + "不能为空")
    @Schema(description = "主键ID")
    private String id;

    @Pattern(regexp = "\\d.*.*", message = "组织id只能为数字")
    @Schema(title = "组织id")
    private String orgId;

    @Pattern(regexp = "\\d.*", message = "上级名称id只能为数字")
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

    @Size(max = 300, message = "备注只能在 0-300 之间")
    @Schema(description = "备注")
    private String remark;

    @Pattern(regexp = "\\d.*", message = "排序只能为数字")
    @Schema(description = "排序")
    private String sort;

    public String getLabel() {
        return CollectionUtils.isEmpty(labelList) ? "" : String.join(",", labelList);
    }
}