package com.hk.auth.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.hk.api.service.RemoteUserService;
import com.hk.auth.bean.PwdLogin;
import com.hk.auth.bean.TokenInfo;
import com.hk.framework.bean.vo.UserVO;
import org.springframework.stereotype.Service;

/**
 * 登录服务
 * </p>
 *
 * @author Matt
 */
@Service
public class LoginService {

    private final RemoteUserService remoteUserService;

    public LoginService(RemoteUserService remoteUserService) {
        this.remoteUserService = remoteUserService;
    }

    public boolean checkUser(String username) {
        UserVO userVO = remoteUserService.selectUserByUsername(username);
        return userVO != null;
    }

    public TokenInfo pwdLogin(PwdLogin login) {
        UserVO user = remoteUserService.selectUserByUsername(login.getUsername());
        if (user == null) {
            throw new RuntimeException("账号不存在");
        }
        // 校验密码
        if (!BCrypt.checkpw(login.getPassword(), user.getPassword())) {
            throw new RuntimeException("密码错误");
        }
        StpUtil.login(user.getId(), new SaLoginModel().build().setDevice(login.getDevice()));
        SaTokenInfo saTokenInfo = StpUtil.getTokenInfo();
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDevice());
    }
}