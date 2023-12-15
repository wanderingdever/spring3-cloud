package com.easy.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.system.bean.dto.user.UserDTO;
import com.easy.system.bean.dto.user.UserEditDTO;
import com.easy.system.bean.dto.user.UserPwdDTO;
import com.easy.system.bean.dto.user.UserSearchDTO;
import com.easy.system.bean.vo.user.UserInfoExpandVO;
import com.easy.system.manager.UserManager;
import com.easy.system.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * 用户
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/user")
@Tag(name = "用户")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @Resource
    private UserManager userManager;

    /**
     * 获取用户信息
     *
     * @return UserInfoVO
     */
    @PostMapping(value = "/user_info")
    @Operation(summary = "获取用户信息")
    public UserInfoExpandVO userInfo(HttpServletRequest request) {
        return userService.getUserInfo(request);
    }

    @PostMapping("/page")
    @Operation(summary = "分页查询")
    public Page<UserInfoExpandVO> page(@RequestBody UserSearchDTO dto) {
        return userService.page(dto);
    }


    @PostMapping("/add")
    @Operation(summary = "新增用户")
    public String add(@Valid @RequestBody UserDTO add) {
        return userManager.add(add);
    }


    @PostMapping("/update")
    @Operation(summary = "更新用户")
    public void update(@Valid @RequestBody UserEditDTO user) {
        userManager.update(user);
    }

    /**
     * 重置密码
     *
     * @param dto 账号
     */
    @PostMapping("/reset_pwd")
    @Operation(summary = "重置密码")
    public void resetPwd(@RequestBody UserPwdDTO dto) {
        userManager.resetPwd(dto);
    }

    /**
     * 删除
     *
     * @param dto 主键集合
     */
    @PostMapping("/del")
    @Operation(summary = "删除用户")
    public void del(@RequestBody IdDTO dto) {
        userManager.del(dto);
    }

    @PostMapping("/page_login")
    @Operation(summary = "分页查询")
    public void pageLogin(@RequestBody UserSearchDTO dto) {

    }

}