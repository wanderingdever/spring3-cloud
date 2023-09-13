package com.hk.framework.bean.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 系统参数配置
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "系统参数配置")
public class ConfigVO implements Serializable {

    @Schema(description = "主键ID")
    private String id;
    /**
     * 参数名称
     */
    @Schema(description = "参数名称")
    private String configName;

    /**
     * 参数键名
     */
    @TableField(value = "config_key")
    @Schema(description = "参数键名")
    private String configKey;

    /**
     * 参数键值
     */
    @Schema(description = "参数键值")
    private String configValue;

    /**
     * 是否是系统内置
     */
    @Schema(description = "是否是系统内置")
    private String isSystem;
    ;

    /**
     * 是否启用
     */
    @Schema(description = "是否启用")
    private String enable;

    /**
     * 创建人
     */
    @Schema(description = "创建人")
    private String createBy;

    /**
     * 创建时间
     */
    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String createTime;

    /**
     * 更新人
     */
    @Schema(description = "更新人")
    private String updateBy;

    /**
     * 更新时间
     */
    @Schema(description = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String updateTime;


    /**
     * 逻辑删除
     */
    @Schema(description = "逻辑删除")
    private String del;
}