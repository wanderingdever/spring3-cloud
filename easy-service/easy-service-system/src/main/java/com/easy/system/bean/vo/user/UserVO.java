package com.easy.system.bean.vo.user;

import com.easy.core.bean.base.BaseVO;
import com.easy.core.enums.AccountClient;
import com.easy.core.enums.AccountStatus;
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