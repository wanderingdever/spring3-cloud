package com.hk.system.bean.vo.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hk.framework.enums.AccountClient;
import com.hk.framework.enums.AccountStatus;
import com.hk.framework.enums.Gender;
import com.hk.system.bean.enums.UserType;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@Schema(description = "用户信息")
public class UserInfoVO implements Serializable {

    @Schema(description = "主键ID")
    private String id;

    @Schema(description = "账号")
    private String username;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "手机号")
    private String phone;

    @Schema(description = "账号客户端")
    private AccountClient client;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "账号状态")
    private AccountStatus status;

    /* info */

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

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String createTime;

    /* 待处理 */

    @Schema(description = "机构id")
    private String orgId;

    @Schema(description = "角色列表")
    private List<String> roles;

    @Schema(description = "权限列表")
    private List<String> permissions;

    @Schema(description = "岗位")
    private List<String> posts;
}