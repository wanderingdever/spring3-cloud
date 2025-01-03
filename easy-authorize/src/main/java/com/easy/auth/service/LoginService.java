package com.easy.auth.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.easy.api.service.RemoteUserService;
import com.easy.api.vo.UserVO;
import com.easy.auth.bean.PwdLogin;
import com.easy.auth.bean.TokenInfo;
import com.easy.auth.bean.UserDTO;
import com.easy.core.enums.AccountStatus;
import com.easy.core.exception.CustomizeException;
import com.easy.redis.constant.CacheConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.utils.lang.StringUtils;
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
     * @param dto 用户名
     * @return 存在true; 不存在false;
     */
    public boolean checkUser(UserDTO dto) {
        UserVO userVO = remoteUserService.selectUserByUsername(dto.getUsername());
        return userVO != null;
    }

    /**
     * 账号密码登录
     *
     * @param login 登录信息 {@link  PwdLogin}
     * @return {@link  TokenInfo}
     */
    public TokenInfo pwdLogin(PwdLogin login) {
        Object cacheObject = RedisUtils.getCacheObject(CacheConstants.CAPTCHA + login.getRandomStr());
        if (StringUtils.isNull(cacheObject) || !login.getValidateCode().equals(cacheObject.toString())) {
            throw new CustomizeException("验证码不正确");
        }
        UserVO user = remoteUserService.selectUserByUsername(login.getUsername());
        if (user == null) {
            throw new CustomizeException("账号不存在");
        }
        // 账号状态
        if (user.getStatus() != AccountStatus.NORMAL) {
            throw new CustomizeException(user.getStatus().getDesc());
        }
        // 校验密码
        if (!BCrypt.checkpw(login.getPassword(), user.getPassword())) {
            throw new CustomizeException("密码错误");
        }
        // 登录
        SaLoginModel loginModel = new SaLoginModel().build().setDevice(login.getDevice());
        StpUtil.login(user.getId(), loginModel);
        // 获取登录信息
        SaTokenInfo saTokenInfo = StpUtil.getTokenInfo();
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDevice());
    }
}