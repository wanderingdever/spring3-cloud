package com.hk.system.bean.vo.user;

import com.hk.framework.enums.Gender;
import com.hk.system.bean.enums.UserType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

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

    @Schema(description = "人脸ID")
    private String faceId;

    @Schema(description = "用户类型")
    private UserType userType;

    @Schema(description = "备注")
    private String remark;
}