package com.easy.system.bean.dto.dict;

import com.easy.datasource.bean.dto.PageDTO;
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
public class DictSearchDTO extends PageDTO {

    @Schema(description = "字典类型")
    private String dictType;

    @Schema(description = "字典标签")
    private String dictLabel;

    @Schema(description = "字典数据状态")
    private Boolean enable;
}