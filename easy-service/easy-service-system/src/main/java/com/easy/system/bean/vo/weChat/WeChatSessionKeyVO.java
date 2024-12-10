package com.easy.system.bean.vo.weChat;

import com.fasterxml.jackson.annotation.JsonAlias;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 微信登录凭证校验响应信息
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "登录凭证校验")
public class WeChatSessionKeyVO extends WeChatErrorCodeVO {

    /**
     * 用户唯一标识
     */
    @Schema(description = "用户唯一标识")
    private String openid;

    /**
     * 用户在开放平台的唯一标识符，若当前小程序已绑定到微信开放平台账号下会返回
     */
    @Schema(description = "用户在开放平台的唯一标识符")
    @JsonAlias("unionid")
    private String unionId;

    /**
     * 会话密钥
     */
    @Schema(description = "会话密钥")
    @JsonAlias("session_key")
    private String sessionKey;
}