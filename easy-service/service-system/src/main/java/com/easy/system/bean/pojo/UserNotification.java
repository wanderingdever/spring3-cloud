package com.easy.system.bean.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.easy.framework.bean.base.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户消息通知关联
 * </p>
 *
 * @author Matt
 */
@Schema(description = "用户消息通知关联")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_user_notification")
public class UserNotification extends BaseEntity {

    @TableField(value = "user_id")
    @Schema(description = "用户ID")
    private String userId;

    @TableField(value = "message_id")
    @Schema(description = "消息ID")
    private String messageId;

    @TableField(value = "read_status")
    @Schema(description = "阅读状态")
    private String readStatus;

}