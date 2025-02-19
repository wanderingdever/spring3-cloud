package com.easy.api.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 文件数据
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "文件信息")
@AllArgsConstructor
@NoArgsConstructor
public class FileVO implements Serializable {

    private static final long serialVersionUID = 5769042420178527549L;

    @Schema(description = "id")
    private String id;

    @Schema(description = "文件原名称")
    private String originalName;

    @Schema(description = "文件相对路径")
    private String relativePath;

    @Schema(description = "文件绝对路径")
    private String absolutePath;

    @Schema(description = "文件host")
    private String host;

    @Schema(description = "文件大小(字节)")
    private String fileSize;

    public FileVO(String originalName, String relativePath, String absolutePath, String host, String fileSize) {
        this.originalName = originalName;
        this.relativePath = relativePath;
        this.absolutePath = absolutePath;
        this.host = host;
        this.fileSize = fileSize;
    }
}