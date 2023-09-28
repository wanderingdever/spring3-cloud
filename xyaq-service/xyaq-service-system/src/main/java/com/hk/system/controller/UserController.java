package com.hk.system.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hk.system.bean.dto.user.UserAddDTO;
import com.hk.system.bean.dto.user.UserSearchDTO;
import com.hk.system.bean.vo.user.UserInfoVO;
import com.hk.system.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

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
    @Operation(summary = "获取用户信息")
    public UserInfoVO userInfo() {
        StpUtil.getLoginId();
        StpUtil.getSession();
        StpUtil.getRoleList();
        StpUtil.getPermissionList();
        return userService.getUserInfo();
    }

    @PostMapping("/add")
    @Operation(summary = "新增用户")
    public String addUser(@RequestBody UserAddDTO add) {
        return userService.addUser(add);
    }

    @PostMapping("/page")
    @Operation(summary = "分页查询")
    public Page<UserInfoVO> page(@RequestBody UserSearchDTO dto) {
        return userService.page(dto);
    }

    @PostMapping("/update")
    @Operation(summary = "更新用户")
    public void updateUser(@Valid @RequestBody UserInfoVO user) {
        userService.updateUser(user);
    }

    /**
     * 删除
     *
     * @param ids 主键集合
     */
    @PostMapping("/del")
    @Operation(summary = "删除用户")
    public void delUser(@RequestBody List<String> ids) {
        userService.delUser(ids);
    }
}