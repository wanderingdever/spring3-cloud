package com.easy.datasource.annotation;

import java.lang.annotation.*;

/**
 * <p>关闭数据校验注解</p>
 *
 * @author 小徐
 * @since 2023/9/21 14:34
 */
@Target(value = {ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface PermissionFilter {

    /**
     * 是否禁用
     */
    boolean disabled() default false;
}