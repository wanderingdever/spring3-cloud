package com.easy.system.uitls;


import com.easy.redis.constant.CacheConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.system.bean.pojo.DictData;
import com.easy.system.bean.pojo.DictType;
import com.easy.utils.json.JacksonUtil;
import jodd.util.StringUtil;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 系统参数工具类
 * </p>
 *
 * @author Matt
 */
public class DictUtils {

    /**
     * 根据字典类型和字典标签获取值
     *
     * @param dictType  字典类型
     * @param dictLabel 字典标签
     */
    public static String getDictLabel(String dictType, String dictLabel) {
        List<DictData> dictList = getDictList(dictType);
        for (DictData dict : dictList) {
            if (dict.getDictLabel().equals(dictLabel)) {
                return dict.getDictValue();
            }
        }
        return null;
    }

    /**
     * 根据字典类型获取所有的字典数据
     *
     * @param dictType 字典类型
     */
    public static List<DictData> getDictList(String dictType) {
        List<DictType> dictList = getCacheDictList();
        if (CollectionUtils.isEmpty(dictList)) {
            throw new RuntimeException("字典数据为空");
        }
        return dictList.stream().filter(type -> type.getDictType().equals(dictType)).findFirst().orElseThrow(() -> new RuntimeException("字典数据为空")).getDictDataList();
    }


    /**
     * 获取全部字典缓存
     *
     * @return List<DictType>
     */
    public static List<DictType> getCacheDictList() {
        String cacheObject = RedisUtils.getCacheObject(CacheConstants.SYSTEM_DICT);
        if (StringUtil.isNotBlank(cacheObject)) {
            return JacksonUtil.jsonToList(cacheObject, DictType.class);
        }
        return null;
    }
}