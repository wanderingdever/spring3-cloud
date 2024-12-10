package com.easy.satoken.utils;

import cn.dev33.satoken.stp.StpUtil;
import com.easy.core.constant.Constants;
import com.easy.core.exception.CustomizeException;

import java.util.List;

/**
 * 登录工具类
 * </p>
 *
 * @author Matt
 */
public class LoginUtil {

    /**
     * 获取账号ID
     *
     * @return String
     */
    public static String getLoginId() {
        return (String) StpUtil.getLoginId();
    }

    /**
     * 获取角色列表
     */
    public static List<String> getRoleList() {
        return StpUtil.getRoleList();
    }

    /**
     * 从sa-token中获取loginID 拆分成客户端ID和登录ID
     * 例如：ADMIN_123456789012345678901234
     *
     * @return String['ADMIN',123123123]
     */
    private static String[] getLoginIdArray() {
        String loginId;
        try {
            loginId = LoginUtil.getLoginId();
        } catch (Exception ignored) {
            throw new CustomizeException("未获取到登录信息");
        }
        return loginId.split(Constants.UNDERLINE);

    }
}