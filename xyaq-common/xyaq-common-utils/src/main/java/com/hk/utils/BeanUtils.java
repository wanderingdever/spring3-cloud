package com.hk.utils;

import cn.hutool.core.bean.BeanUtil;

import java.util.List;

public class BeanUtils {

    public static <S, T> List<T> copyList(List<S> src, List<T> target, Class<T> targetClass) {
        for (S s : src) {
            try {
                Object object = targetClass.getDeclaredConstructor().newInstance();
                target.add((T) object);
                BeanUtil.copyProperties(s, object);
            } catch (Exception e) {
                // 某个方法反射异常
                throw new RuntimeException("populateList fail");
            }
        }
        return target;
    }
}