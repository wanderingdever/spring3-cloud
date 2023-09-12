package com.hk.framework.annotation;

import com.hk.framework.vo.R;

import java.lang.annotation.*;

/**
 * <p>用于将 controller 返回值用 {@link R R} 包裹</p>
 *
 * @author 小徐
 * @since 2023/9/12 13:57
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Wrap {

    /**
     * 是否禁用
     */
    boolean disabled() default false;
}