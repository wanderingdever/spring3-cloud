package com.hk.api.service;

import com.hk.api.vo.UserRoleAndPermissionVO;

/**
 * 角色信息
 * </p>
 *
 * @author Matt
 */
public interface RemoteRoleService {


    /**
     * 根据用户ID获取角色key列表
     *
     * @param userId 用户ID
     * @return {@link UserRoleAndPermissionVO}
     */
    UserRoleAndPermissionVO getUserRoleKeyList(String userId);
}