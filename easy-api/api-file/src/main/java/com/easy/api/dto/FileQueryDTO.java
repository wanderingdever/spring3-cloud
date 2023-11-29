package com.easy.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 文件信息
 * </p>
 *
 * @author hk
 */
@Data
@Schema(description = "文件信息")
public class FileQueryDTO implements Serializable {

    private static final long serialVersionUID = 5571987933556796125L;

    @Schema(description = "主键ids")
    private List<String> ids;

    @Schema(description = "文件名")
    private String fileName;

    @Schema(description = "文件路径")
    private String filePath;

    @Schema(description = "文件类型")
    private String fileType;

}