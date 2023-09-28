package com.hk.system.bean.dto.user;

import com.hk.datasource.bean.dto.PageDTO;
import com.hk.framework.enums.AccountStatus;
import com.hk.framework.enums.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户查询
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "用户查询/分页入参")
public class UserSearchDTO extends PageDTO {

    @Schema(title = "性别")
    private Gender gender;

    @Schema(title = "账号")
    private String username;

    @Schema(title = "手机号")
    private String phone;

    @Schema(title = "邮箱")
    private String email;

    @Schema(title = "账号状态")
    private AccountStatus accountStatus;
}