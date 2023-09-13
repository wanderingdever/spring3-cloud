package com.hk.auth.controller;

import com.hk.auth.bean.PwdLogin;
import com.hk.auth.bean.TokenInfo;
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
@Tag(name = "登录")
public class LoginController {


    @GetMapping("/check_user/{username}")
    @Operation(description = "检查用户")
    public boolean checkUser(@PathVariable String username) {
        return true;
    }

    @PostMapping("/pwd_login")
    @Operation(description = "密码登录")
    public TokenInfo pwdLogin(@Valid PwdLogin login) {
        // TODO 密码登录
        return null;
    }

    @PostMapping("/code_login")
    @Operation(description = "验证码登录")
    public TokenInfo codeLogin(@Valid PwdLogin login) {
        // TODO 密码登录
        return null;
    }
}