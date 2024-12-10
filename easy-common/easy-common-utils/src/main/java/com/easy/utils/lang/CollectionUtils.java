package com.easy.utils.lang;

import org.dromara.hutool.core.collection.CollUtil;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 集合工具类
 * </p>
 *
 * @author Matt
 */
public class CollectionUtils extends CollUtil {
    /**
     * 行转列，把传入的实体数据转换成List<String>
     *
     * @param object      源类型
     * @param objectClass 源类型
     * @return List<String>
     */
    public static <T> List<String> rowToColumn(T object, Class<T> objectClass) {
        List<Field> fields = Arrays.stream(objectClass.getDeclaredFields()).toList();
        fields.forEach(field -> field.setAccessible(true));
        return fields.stream()
                .map(field -> {
                    try {
                        Object value = field.get(object);
                        // 为空就不添加
                        return Optional.ofNullable(value).map(String::valueOf);
                    } catch (IllegalAccessException e) {
                        throw new RuntimeException(e);
                    }
                })
                .flatMap(Optional::stream)
                .collect(Collectors.toList());
    }


    /**
     * 获取集合中的最后N个元素。
     *
     * @param originalList 原始集合
     * @param count        需要获取的元素数量
     * @param <T>          集合中元素的类型
     * @return 包含原集合最后N个元素的新集合
     */
    public static <T> List<T> getLastElements(List<T> originalList, int count) {
        if (originalList == null || originalList.isEmpty() || count <= 0) {
            // 如果参数无效，返回空集合
            return new ArrayList<>();
        }
        // 确保startIndex不会是负数
        int startIndex = Math.max(0, originalList.size() - count);
        return new ArrayList<>(originalList.subList(startIndex, originalList.size()));
    }
}