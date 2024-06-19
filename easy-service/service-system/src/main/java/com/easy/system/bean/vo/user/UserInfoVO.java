package com.easy.system.bean.vo.user;

import com.easy.framework.enums.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "用户信息")
public class UserInfoVO extends UserVO implements Serializable {

    @Schema(description = "用户信息ID")
    private String userInfoId;

    @Schema(description = "昵称")
    private String nickname;

    @Schema(description = "头像")
    private String avatar;

    @Schema(description = "姓名")
    private String name;

    @Schema(description = "证件号码")
    private String idCard;

    @Schema(description = "性别")
    private Gender gender;

}