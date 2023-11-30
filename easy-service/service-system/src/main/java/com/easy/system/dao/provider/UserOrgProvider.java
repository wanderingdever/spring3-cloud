package com.easy.system.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.system.bean.pojo.UserOrg;

/**
 * 用户机构
 * </p>
 *
 * @author Matt
 */
public class UserOrgProvider extends BaseProvider<UserOrg> {

    private static final UserOrgProvider PROVIDER = new UserOrgProvider();

    public static UserOrgProvider get() {
        return PROVIDER;
    }
}