package com.easy.system.bean.vo.user;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.List;

/**
 * 用户拓展详情 关联角色 权限 机构 岗位
 * </p>
 *
 * @author Matt
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(description = "用户信息-拓展")
public class UserInfoExpandVO extends UserInfoVO implements Serializable {

    @Schema(description = "机构id")
    private String orgId;

    @Schema(description = "角色列表")
    private List<String> roleList;

    @Schema(description = "权限列表")
    private List<String> permissionList;

    @Schema(description = "岗位")
    private List<String> postList;
}