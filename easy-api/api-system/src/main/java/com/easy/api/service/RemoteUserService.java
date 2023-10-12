package com.easy.api.service;

import com.easy.api.vo.UserVO;

import java.util.List;

/**
 * 用户信息
 * </p>
 *
 * @author Matt
 */
public interface RemoteUserService {


    /**
     * 根据账号信息获取用户信息
     *
     * @param username 账号/手机号/邮箱
     * @return {@link UserVO}
     */
    UserVO selectUserByUsername(String username);

    List<String> authorizedOrgIdListOneSelf();

    List<String> authorizedOrgIdList();
}