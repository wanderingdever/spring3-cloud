package com.easy.system.bean.vo.weChat;

import com.fasterxml.jackson.annotation.JsonAlias;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 微信响应accessToken
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "微信响应accessToken")
public class WeChatAccessTokenVO extends WeChatErrorCodeVO {

    @Schema(description = "获取到的凭证accessToken")
    @JsonAlias("access_token")
    private String accessToken;

    @Schema(description = "凭证有效时间，单位：秒。目前是7200秒之内的值")
    @JsonAlias("expires_in")
    private String expiresIn;

}