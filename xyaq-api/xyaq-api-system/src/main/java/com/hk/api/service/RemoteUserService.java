package com.hk.api.service;

import com.hk.framework.bean.vo.UserVO;
import com.hk.framework.config.FeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * 用户信息
 * </p>
 *
 * @author Matt
 */
@FeignClient(name = "service-system", contextId = "service-system", path = "/api/user", configuration =
        FeignConfig.class)
public interface RemoteUserService {


    /**
     * 根据账号信息获取用户信息
     *
     * @param username 账号/手机号/邮箱
     * @return {@link com.hk.framework.bean.vo.UserVO}
     */
    @PostMapping("/selectUserByUsername")
    UserVO selectUserByUsername(@RequestBody String username);
}