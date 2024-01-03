package com.easy.auth.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import com.easy.api.service.RemoteUserService;
import com.easy.api.vo.UserVO;
import com.easy.auth.bean.PwdLogin;
import com.easy.auth.bean.TokenInfo;
import com.easy.framework.enums.AccountClient;
import com.easy.framework.exception.CustomizeException;
import com.easy.redis.constant.CacheConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.satoken.stp.StpAdminUtil;
import com.easy.utils.lang.StringUtil;
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
        if (login.getClient() == AccountClient.ADMIN) {
            return adminLogin(login);
        }
        return null;
    }

    /**
     * 管理端登录
     *
     * @param login 登录信息
     * @return TokenInfo
     */
    private TokenInfo adminLogin(PwdLogin login) {
        Object cacheObject = RedisUtils.getCacheObject(CacheConstants.CAPTCHA + login.getRandomStr());
        if (StringUtil.isNull(cacheObject) || !login.getValidateCode().equals(cacheObject.toString())) {
            throw new CustomizeException("验证码不正确");
        }
        UserVO user = remoteUserService.selectUserByUsername(login.getUsername());
        if (user == null) {
            throw new CustomizeException("账号不存在");
        }
        if (user.getClient() != AccountClient.ADMIN) {
            throw new CustomizeException("账号不存在");
        }
        // 校验密码
        if (!BCrypt.checkpw(login.getPassword(), user.getPassword())) {
            throw new CustomizeException("密码错误");
        }
        // 登录
        SaLoginModel loginModel = new SaLoginModel().build().setDevice(login.getDevice());
        StpAdminUtil.login(user.getId(), loginModel);
        // 获取登录信息
        SaTokenInfo saTokenInfo = StpAdminUtil.getTokenInfo();
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDevice());
    }
}