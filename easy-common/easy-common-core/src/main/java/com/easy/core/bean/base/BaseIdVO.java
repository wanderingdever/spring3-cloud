package com.easy.core.bean.base;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;

@Data
@Tag(name = "公共父类VO id")
public class BaseIdVO {

    @Schema(description = "主键ID")
    private String id;
}