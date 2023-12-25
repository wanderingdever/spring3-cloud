package com.easy.system.bean.vo.notice;

import com.easy.framework.bean.base.BaseVO;
import com.easy.framework.enums.ArticleStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 消息通知
 * </p>
 *
 * @author Matt
 */
@Schema(description = "消息通知")
@Data
@EqualsAndHashCode(callSuper = true)
public class NoticeVO extends BaseVO {

    @Schema(description = "标题")
    private String title;

    @Schema(description = "类型")
    private String type;

    @Schema(description = "内容")
    private String content;

    @Schema(description = "状态")
    private ArticleStatus status;

    @Schema(description = "接收人ID")
    private List<String> userIds;
}