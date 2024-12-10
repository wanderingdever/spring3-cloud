package com.easy.system.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.system.bean.pojo.Role;

/**
 * 角色
 * </p>
 *
 * @author Matt
 */
public class RoleProvider extends BaseProvider<Role> {

    private static final RoleProvider PROVIDER = new RoleProvider();

    public static RoleProvider get() {
        return PROVIDER;
    }
}