// WeChatUserPhoneVO.java

// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

package com.easy.system.bean.vo.weChat;

import com.fasterxml.jackson.annotation.JsonAlias;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 微信用户手机号
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "微信用户手机号")
public class WeChatUserPhoneVO extends WeChatErrorCodeVO {

    @Schema(description = "手机号信息")
    @JsonAlias("phone_info")
    private PhoneInfo phoneInfo;

}

@Data
@Schema(description = "手机号信息")
class PhoneInfo implements Serializable {
    @Schema(description = "用户绑定的手机号（国外手机号会有区号）")
    private String phoneNumber;

    @Schema(description = "没有区号的手机号")
    private String purePhoneNumber;

    @Schema(description = "区号")
    private String countryCode;

}