package com.easy.system.dao.provider;

import com.easy.datasource.dao.BaseProvider;
import com.easy.system.bean.pojo.Org;

/**
 * 机构
 * </p>
 *
 * @author Matt
 */
public class OrgProvider extends BaseProvider<Org> {

    private static final OrgProvider PROVIDER = new OrgProvider();

    public static OrgProvider get() {
        return PROVIDER;
    }
}