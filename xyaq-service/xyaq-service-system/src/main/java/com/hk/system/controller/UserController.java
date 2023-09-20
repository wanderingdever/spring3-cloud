package com.hk.system.controller;

import com.hk.system.bean.dto.UserAddDTO;
import com.hk.system.bean.vo.UserInfoVO;
import com.hk.system.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/user")
@Tag(name = "用户", description = "用户相关接口")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * 获取用户信息
     *
     * @return UserInfoVO
     */
    @PostMapping(value = "/user_info")
    @Operation(description = "获取用户信息")
    public UserInfoVO userInfo() {
        return userService.getUserInfo();
    }

    @PostMapping("/add")
    @Operation(description = "新增用户")
    public String addUser(@RequestBody UserAddDTO add) {
        return userService.addUser(add);
    }
}