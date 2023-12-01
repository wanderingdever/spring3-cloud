package com.easy.system.bean.dto.user;

import com.easy.framework.enums.AccountClient;
import com.easy.framework.enums.AccountStatus;
import com.easy.framework.enums.Gender;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

/**
 * 用户新增-入参
 * </p>
 *
 * @author Matt
 */
@Data
@Schema(title = "用户新增-入参")
public class UserAddDTO {

    @Schema(description = "机构ID", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "机构信息不能为空")
    private List<String> orgList;

    @Schema(description = "用户名", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "用户名不能为空")
    private String username;

    @Schema(description = "密码", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "密码不能为空")
    private String password;

    @Schema(description = "邮箱")
    private String email;

    @Schema(description = "手机号")
    private String phone;

    @Schema(description = "所属客户端")
    private AccountClient client;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "账号状态")
    private AccountStatus status;

    /* info */

    @Schema(description = "姓名")
    private String name;

    @Schema(description = "性别")
    private Gender gender;

    /* 其他 */

    @Schema(description = "岗位")
    private List<String> postList;

    @Schema(description = "角色")
    private List<String> roleList;
}