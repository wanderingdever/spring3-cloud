package com.hk.auth.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.hk.api.service.RemoteUserService;
import com.hk.api.vo.UserVO;
import com.hk.auth.bean.PwdLogin;
import com.hk.auth.bean.TokenInfo;
import com.hk.satoken.constant.SaConstant;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import java.util.List;

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
        // 获取授权部门
        List<String> orgIdList = remoteUserService.authorizedOrgIdList(false);
        List<String> orgIdListContainsChild = remoteUserService.authorizedOrgIdList(true);
        // 登录
        SaLoginModel loginModel = new SaLoginModel()
                .build()
                .setDevice(login.getDevice())
                .setExtra(SaConstant.AUTHORIZED_ORG_ID_LIST, orgIdList)
                .setExtra(SaConstant.AUTHORIZED_ORG_ID_LIST_AND_CHILD, orgIdListContainsChild);
        StpUtil.login(user.getId(), loginModel);
        // 获取登录信息
        SaTokenInfo saTokenInfo = StpUtil.getTokenInfo();
        StpUtil.getRoleList();
        return new TokenInfo(saTokenInfo.getTokenValue(), saTokenInfo.getTokenTimeout(), saTokenInfo.getLoginDevice());
    }
}