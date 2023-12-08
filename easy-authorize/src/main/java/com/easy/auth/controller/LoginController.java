package com.easy.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.easy.auth.bean.PwdLogin;
import com.easy.auth.bean.TokenInfo;
import com.easy.auth.service.LoginService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

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
    public boolean checkUser(@RequestParam String username) {
        return loginService.checkUser(username);
    }

    @PostMapping("/pwd_login")
    @Operation(description = "密码登录")
    public TokenInfo pwdLogin(@RequestBody @Valid PwdLogin login, HttpServletRequest request) {
        return loginService.pwdLogin(login, request);
    }

    @PostMapping("/code_login")
    @Operation(description = "验证码登录")
    public TokenInfo codeLogin(@Valid PwdLogin login) {
        // TODO 密码登录
        return null;
    }

    @PostMapping("/logout")
    @Operation(description = "退出登录")
    public void logout() {
        StpUtil.logout(StpUtil.getLoginId());
    }
}