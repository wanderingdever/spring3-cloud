package com.hk.system.dao.provider;

import com.hk.datasource.dao.BaseProvider;
import com.hk.system.bean.pojo.UserInfo;

public class UserInfoProvider extends BaseProvider<UserInfo> {

    private static final UserInfoProvider provider = new UserInfoProvider();

    public static UserInfoProvider get() {
        return provider;
    }
}