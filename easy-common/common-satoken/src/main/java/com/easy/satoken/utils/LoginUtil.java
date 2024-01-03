package com.easy.satoken.utils;

import com.easy.framework.constant.Constants;
import com.easy.framework.exception.CustomizeException;
import com.easy.satoken.stp.StpAdminUtil;

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
        return (String) StpAdminUtil.getLoginId();
    }

    /**
     * 获取角色列表
     */
    public static List<String> getRoleList() {
        return StpAdminUtil.getRoleList();
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