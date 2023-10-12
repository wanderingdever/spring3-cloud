package com.easy.datasource.dao;

import com.easy.framework.bean.base.BaseEntity;

public class BaseEntityProvider extends BaseProvider<BaseEntity> {

    private static final BaseEntityProvider provider = new BaseEntityProvider();

    public static BaseEntityProvider get() {
        return provider;
    }
}