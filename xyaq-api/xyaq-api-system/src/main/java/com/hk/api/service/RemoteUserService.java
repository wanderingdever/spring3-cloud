package com.hk.api.service;

import com.hk.framework.bean.vo.UserVO;

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
     * @return {@link com.hk.framework.bean.vo.UserVO}
     */
    UserVO selectUserByUsername(String username);
}