package com.hk.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hk.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 系统参数配置
 * </p>
 *
 * @author Matt
 */
@Schema(description = "系统参数配置")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "xyaq_config")
public class Config extends BaseEntity {
    /**
     * 参数名称
     */
    @TableField(value = "config_name")
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
    @TableField(value = "config_value")
    @Schema(description = "参数键值")
    private String configValue;

    /**
     * 是否是系统内置
     */
    @TableField(value = "is_system")
    @Schema(description = "是否是系统内置")
    private String isSystem;
    ;

    /**
     * 是否启用
     */
    @TableField(value = "`enable`")
    @Schema(description = "是否启用")
    private String enable;


}