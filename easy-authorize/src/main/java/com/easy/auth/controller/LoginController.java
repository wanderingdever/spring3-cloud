package com.easy.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.easy.auth.bean.PwdLogin;
import com.easy.auth.bean.TokenInfo;
import com.easy.auth.bean.UserDTO;
import com.easy.auth.service.LoginService;
import com.easy.satoken.utils.LoginUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 登录
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping()
@Tag(name = "授权接口")
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @PostMapping("/check_user")
    @Operation(description = "检查用户")
    public boolean checkUser(@RequestBody UserDTO dto) {
        return loginService.checkUser(dto);
    }

    @PostMapping("/pwd_login")
    @Operation(description = "密码登录")
    public TokenInfo pwdLogin(@RequestBody @Valid PwdLogin login) {
        return loginService.pwdLogin(login);
    }

    @PostMapping("/logout")
    @Operation(description = "退出登录")
    public void logout() {
        StpUtil.logout(LoginUtil.getLoginId());
    }
}