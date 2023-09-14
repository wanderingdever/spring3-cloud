package com.hk.system.bean.dto.device.info;

import com.hk.datasource.bean.dto.PageDTO;
import com.hk.system.bean.enums.DeviceTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "设备信息-分页-请求参数")
public class DeviceInfoPageDTO extends PageDTO {

    /**
     * {@link DeviceTypeEnum DeviceTypeEnum}
     */
    @Schema(title = "设备类型")
    private String type;

    @Schema(description = "设备名称")
    private String name;

    @Schema(description = "设备名称简称")
    private String shortName;

    @Pattern(regexp = "\\d.*", message = "id只能为数字")
    @Schema(description = "位置id")
    private String deviceLocationId;

    @Schema(description = "设备ip")
    private String ip;

    @Schema(description = "标签")
    private List<String> labelList;
}