package com.hk.api.vo;

import com.hk.framework.bean.base.BaseVO;
import com.hk.framework.enums.YesOrNo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 字典类型
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "字典类型")
public class DictTypeVO extends BaseVO {

    /**
     * 字典名称
     */
    @Schema(description = "字典名称")
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
    private YesOrNo isSystem;

    /**
     * 是否启用(0否,1-是)
     */
    @Schema(description = "是否启用(0否,1-是)")
    private YesOrNo enable;

    @Schema(description = "字典数据")
    private List<DictDataVO> dictDataList;
}