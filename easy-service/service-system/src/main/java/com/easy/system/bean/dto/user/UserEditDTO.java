package com.easy.system.bean.dto.user;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "用户编辑-入参")
public class UserEditDTO extends UserAddDTO {

    @NotBlank(message = "id" + "不能为空")
    @Schema(title = "id")
    private String id;
}