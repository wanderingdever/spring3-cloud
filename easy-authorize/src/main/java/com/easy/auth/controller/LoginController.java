package com.easy.auth.controller;

import com.easy.auth.bean.PwdLogin;
import com.easy.auth.bean.TokenInfo;
import com.easy.auth.service.LoginService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
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

    @GetMapping("/check_user/{username}")
    @Operation(description = "检查用户")
    public boolean checkUser(@PathVariable String username) {
        return loginService.checkUser(username);
    }

    @PostMapping("/pwd_login")
    @Operation(description = "密码登录")
    public TokenInfo pwdLogin(@RequestBody @Valid PwdLogin login) {
        return loginService.pwdLogin(login);
    }

    @PostMapping("/code_login")
    @Operation(description = "验证码登录")
    public TokenInfo codeLogin(@Valid PwdLogin login) {
        // TODO 密码登录
        return null;
    }
}