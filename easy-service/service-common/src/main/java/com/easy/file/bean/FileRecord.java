package com.easy.file.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 文件上传记录
 * </p>
 *
 * @author matt
 */
@EqualsAndHashCode(callSuper = true)
@Schema(description = "文件上传记录")
@Data
@TableName(value = "sys_file_record")
public class FileRecord extends BaseEntity {

    @Schema(description = "文件原名称")
    @TableField(value = "file_name")
    private String fileName;

    @Schema(description = "文件路径")
    @TableField(value = "file")
    private String file;

    @Schema(description = "文件类型")
    @TableField(value = "file_type")
    private String fileType;

    @Schema(description = "文件大小(字节)")
    @TableField(value = "file_size")
    private String fileSize;

}