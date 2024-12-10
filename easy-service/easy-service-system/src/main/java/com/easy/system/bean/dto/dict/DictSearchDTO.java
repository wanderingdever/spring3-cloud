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

    @Schema(description = "字典名字")
    private String dictName;

    /**
     * 字典类型
     */
    @Schema(description = "字典类型")
    private String dictType;

    /**
     * 是否是系统内置
     */
    @Schema(description = "是否是系统内置")
    private Boolean isSystem;

    @Schema(description = "字典标签")
    private String dictLabel;

    @Schema(description = "数据状态")
    private Boolean enable;
}