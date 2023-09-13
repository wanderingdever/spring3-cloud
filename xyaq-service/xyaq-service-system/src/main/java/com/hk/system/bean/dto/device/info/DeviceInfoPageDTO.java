package com.hk.system.bean.dto.device.info;

import com.hk.datasource.bean.dto.PageDTO;
import com.hk.system.bean.enums.DeviceTypeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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

    @Schema(title = "设备code")
    private String code;
}