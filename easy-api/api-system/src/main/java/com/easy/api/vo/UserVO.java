package com.easy.api.vo;

import com.easy.framework.bean.base.BaseVO;
import com.easy.framework.enums.AccountClient;
import com.easy.framework.enums.AccountStatus;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户信息
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UserVO extends BaseVO {

    /**
     * 账号
     */
    @Schema(description = "账号")
    private String username;

    /**
     * 密码
     */
    @Schema(description = "密码")
    private String password;

    /**
     * 邮箱
     */
    @Schema(description = "邮箱")
    private String email;

    /**
     * 手机号
     */
    @Schema(description = "手机号")
    private String phone;

    /**
     * 所属客户端
     */
    @Schema(description = "所属客户端")
    private AccountClient client;

    /**
     * 排序
     */
    @Schema(description = "排序")
    private Integer sort;

    /**
     * 账号状态
     */
    @Schema(description = "账号状态")
    private AccountStatus status;
}