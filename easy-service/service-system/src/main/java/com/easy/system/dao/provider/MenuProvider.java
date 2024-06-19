package com.easy.system.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.system.bean.pojo.Menu;

/**
 * 菜单provider
 * </p>
 *
 * @author Matt
 */
public class MenuProvider extends BaseProvider<Menu> {

    private static final UserInfoProvider PROVIDER = new UserInfoProvider();

    public static UserInfoProvider get() {
        return PROVIDER;
    }

}