package com.hk.system.api;

import com.hk.framework.bean.vo.UserVO;
import com.hk.system.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户相关的内部接口
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/api/user")
public class UserApi {

    private final UserService userService;

    public UserApi(UserService userService) {
        this.userService = userService;
    }

    /**
     * 根据账号信息获取用户信息
     *
     * @param username 账号/手机号/邮箱
     * @return {@link com.hk.framework.bean.vo.UserVO}
     */
    @PostMapping("/selectUserByUsername")
    public UserVO selectUserByUsername(String username) {
        return userService.selectUserByUsername(username);
    }
}