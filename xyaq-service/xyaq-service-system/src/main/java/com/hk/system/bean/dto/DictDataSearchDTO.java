package com.hk.system.bean.dto;

import com.hk.datasource.bean.dto.PageDTO;
import com.hk.framework.enums.YesOrNo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 字典数据分页查询入参
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "字典数据分页查询入参")
public class DictDataSearchDTO extends PageDTO {

    @Schema(description = "字典类型")
    private String dictType;

    @Schema(description = "字典标签")
    private String dictLabel;

    @Schema(description = "字典数据状态")
    private YesOrNo enable;
}