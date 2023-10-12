package com.easy.system.bean.dto.dict;


import com.easy.datasource.bean.dto.PageDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 字典类型分页查询入参
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "字典类型分页查询入参")
public class DictTypeSearchDTO extends PageDTO {

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

    /**
     * 是否启用(0否,1-是)
     */
    @Schema(description = "是否启用(0否,1-是)")
    private Boolean enable;
}