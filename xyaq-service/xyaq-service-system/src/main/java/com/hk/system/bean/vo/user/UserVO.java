package com.hk.system.bean.vo.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hk.framework.enums.AccountClient;
import com.hk.framework.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

@Data
@Schema(description = "用户")
public class UserVO implements Serializable {

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

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String createTime;
}