package com.hk.system.bean.vo.user;

import com.hk.framework.bean.base.BaseVO;
import com.hk.framework.enums.AccountClient;
import com.hk.framework.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "用户")
public class UserVO extends BaseVO implements Serializable {

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
}