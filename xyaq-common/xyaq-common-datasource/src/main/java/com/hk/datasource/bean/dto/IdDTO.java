package com.hk.datasource.bean.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "id 请求参数")
public class IdDTO {

    @NotBlank(message = "id" + "不能为空")
    @Schema(title = "id")
    private String id;
}