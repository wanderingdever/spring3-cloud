package com.easy.system.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.system.bean.pojo.UserInfo;

/**
 * 用户信息
 * </p>
 *
 * @author Matt
 */
public class UserInfoProvider extends BaseProvider<UserInfo> {

    private static final UserInfoProvider PROVIDER = new UserInfoProvider();

    public static UserInfoProvider get() {
        return PROVIDER;
    }
}