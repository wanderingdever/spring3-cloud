package com.easy.system.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.system.bean.pojo.UserInfo;

public class UserInfoProvider extends BaseProvider<UserInfo> {

    private static final UserInfoProvider provider = new UserInfoProvider();

    public static UserInfoProvider get() {
        return provider;
    }
}