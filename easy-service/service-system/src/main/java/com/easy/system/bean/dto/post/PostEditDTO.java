package com.easy.system.bean.dto.post;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "岗位编辑-请求参数")
public class PostEditDTO extends PostDTO {

    @NotBlank(message = "id" + "不能为空")
    @Schema(title = "id")
    private String id;
}