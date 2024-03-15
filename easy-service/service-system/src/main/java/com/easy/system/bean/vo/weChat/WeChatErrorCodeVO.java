package com.easy.system.bean.vo.weChat;

import com.fasterxml.jackson.annotation.JsonAlias;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 微信错误响应码
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(description = "微信错误响应码")
public class WeChatErrorCodeVO implements Serializable {

    @Schema(description = "错误代码")
    @JsonAlias("errcode")
    private Integer errCode;

    @Schema(description = "错误信息")
    @JsonAlias("errmsg")
    private String errMsg;
}