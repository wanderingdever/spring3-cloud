package com.easy.datasource.config;import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;import com.easy.satoken.utils.LoginUtil;import com.easy.utils.lang.DateUtils;import org.apache.ibatis.reflection.MetaObject;import org.springframework.stereotype.Component;/** * mybatis plus字段自动填充拦截 * </p> * * @author Matt */@Componentpublic class MybatisPlusMetaObjectHandler implements MetaObjectHandler {    /**     * 创建     *     * @param metaObject 拦截     */    @Override    public void insertFill(MetaObject metaObject) {        setFieldValByName("createTime", DateUtils.nowDateTime(), metaObject);        String createBy = "0";        try {            createBy = LoginUtil.getLoginId();        } catch (Exception ignored) {        }        setFieldValByName("createBy", createBy, metaObject);    }    /**     * 最后一次更新     *     * @param metaObject 拦截     */    @Override    public void updateFill(MetaObject metaObject) {        String updateBy = "0";        try {            updateBy = LoginUtil.getLoginId();        } catch (Exception ignored) {        }        setFieldValByName("updateTime", DateUtils.nowDateTime(), metaObject);        setFieldValByName("updateBy", updateBy, metaObject);    }}