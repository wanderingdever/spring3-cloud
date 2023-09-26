package com.hk.system.bean.vo.post;

import com.hk.framework.bean.base.BaseVO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "岗位查询-响应参数")
public class PostVO extends BaseVO {

    @Schema(description = "机构ID")
    private String orgId;

    @Schema(description = "岗位编码")
    private String postCode;

    @Schema(description = "岗位名称")
    private String postName;

    @Schema(description = "显示顺序")
    private Integer postSort;

    @Schema(description = "是否轮岗")
    private String isRotation;

    @Schema(description = "是否启用")
    private String enable;

    @Schema(description = "备注")
    private String remark;
}