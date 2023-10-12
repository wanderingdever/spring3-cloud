package com.easy.auth.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.easy.api.service.RemoteUserService;
import com.easy.api.vo.UserVO;
import com.easy.auth.bean.PwdLogin;
import com.easy.auth.bean.TokenInfo;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

/**
 * 登录服务
 * </p>
 *
 * @author Matt
 */
@Service
@Validated
public class LoginService {

    @DubboReference
    private RemoteUserService remoteUserService;

    /**
     * 检查用户是否已存在
     *
     * @param username 用户名
     * @return 存在true; 不存在false;
     */
    public boolean checkUser(String username) {
        UserVO userVO = remoteUserService.selectUserByUsername(username);
        return userVO != null;
    }

    /**
     * 账号密码登录
     *
     * @param login 登录信息 {@link  PwdLogin}
     * @return {@link  TokenInfo}
     */
    public TokenInfo pwdLogin(PwdLogin login) {
        UserVO user = remoteUserService.selectUserByUsername(login.getUsername());
        if (user == null) {
            throw new RuntimeException("账号不存在");
        }
        // 校验密码
        if (!BCrypt.checkpw(login.getPassword(), user.getPassword())) {
            throw new RuntimeException("密码错误");
        }
        // 登录
        SaLoginModel loginModel = new SaLoginModel()
                .build()
                .setDevice(login.getDevice());
        StpUtil.login(user.getId(), loginModel);
        // 获取登录信息
        SaTokenInfo saTokenInfo = StpUtil.getTokenInfo();
        StpUtil.getRoleList();
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDevice());
    }
}