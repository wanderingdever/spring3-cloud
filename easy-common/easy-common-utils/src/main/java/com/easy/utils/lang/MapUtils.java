package com.easy.utils.lang;


import com.easy.utils.json.JacksonUtils;
import org.apache.poi.ss.formula.functions.T;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Map工具类
 * <p>
 * 2022/3/11 10:42
 *
 * @author Matt
 */
public class MapUtils {

    private MapUtils() {
        throw new IllegalAccessError("MapUtil.class");
    }

    /**
     * 对象转map 下划线
     *
     * @param obj 对象
     * @return key为下划线的map
     */
    public static Map<String, Object> objectToMapGlideLine(Object obj) throws IllegalAccessException {
        Map<String, Object> map = new HashMap<>();
        Class<?> clazz = obj.getClass();
        for (Field field : clazz.getDeclaredFields()) {
            field.setAccessible(true);
            String fieldName = field.getName();
            fieldName = StringUtils.lineToHump(fieldName);
            Object value = field.get(obj);
            map.put(fieldName, value);
        }
        return map;
    }

    /**
     * 实体对象转成json 再转化为map
     *
     * @param obj 实体对象
     * @return Map<String, Object>
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> objectToMapJson(Object obj) {

        String jsonString = JacksonUtils.toJsonString(obj);
        Map<String, Object> javaObject = JacksonUtils.parseObject(jsonString, HashMap.class);
        javaObject = javaObject.entrySet()
                .stream()
                .filter(entry -> entry.getValue() != null)
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
        Map<String, Object> x = Map.copyOf(javaObject);
        Map<String, Object> stringObjectHashMap = new HashMap<>(x);
        for (String key : stringObjectHashMap.keySet()) {
            Object o = stringObjectHashMap.get(key);
            if (o instanceof String || o instanceof Double || o instanceof Integer || o instanceof Long || o instanceof Float || o instanceof Boolean) {
                continue;
            }
            if (o instanceof List<?> list) {
                stringObjectHashMap.put(key, list.stream().map(MapUtils::objectToMapJson).toList());
                continue;
            }
            Map<String, Object> map = objectToMapJson(o);
            stringObjectHashMap.put(key, map);
        }
        return stringObjectHashMap;
    }

    /**
     * 实体对象转成Map
     *
     * @param obj 实体对象
     * @return Map<String, Object>
     */
    public static Map<String, Object> objectToMap(Object obj) {
        Map<String, Object> map = new HashMap<>();
        if (obj == null) {
            return map;
        }
        Class<?> clazz = obj.getClass();
        Field[] fields = clazz.getDeclaredFields();
        try {
            for (Field field : fields) {
                field.setAccessible(true);
                map.put(field.getName(), field.get(obj));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * Map转成实体对象
     *
     * @param map   map实体对象包含属性
     * @param clazz 实体对象类型
     * @return Object
     */
    public static Object mapToObject(Map<String, Object> map, Class<?> clazz) {
        if (map == null) {
            return null;
        }
        Object obj = null;
        try {
            obj = clazz.getDeclaredConstructor().newInstance();
            Field[] fields = obj.getClass().getDeclaredFields();
            for (Field field : fields) {
                int mod = field.getModifiers();
                if (Modifier.isStatic(mod) || Modifier.isFinal(mod)) {
                    continue;
                }
                field.setAccessible(true);
                field.set(obj, map.get(field.getName()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }

    /**
     * 递归读取所有字段
     */
    private static List<Field> getAllFields(Class<? super T> clazz) {

        List<Field> fieldList = new ArrayList<>();
        if (null == clazz) {
            return fieldList;
        }
        fieldList.addAll(Arrays.asList(clazz.getDeclaredFields()));
        List<Field> superClassFieldList = getAllFields(clazz.getSuperclass());
        fieldList.addAll(superClassFieldList);
        return fieldList;
    }

    /**
     * 将两个 map 集合数据相加
     * <p>
     * <font color="#FF0000">报错</font>
     */
    public static <K, V> Map<K, Collection<V>> plusMap(Map<K, Collection<V>> map1, Map<K, Collection<V>> map2) {

        Map<K, Collection<V>> finalMap = new HashMap<>(map1);
        map2.forEach((k, v) -> {
            if (!finalMap.containsKey(k)) {
                finalMap.put(k, v);
            } else {
                Collection<V> collection = finalMap.get(k);
                Set<V> setFinal = new HashSet<>(collection);
                setFinal.addAll(v);
                finalMap.put(k, setFinal);
            }
        });
        return finalMap;
    }
}