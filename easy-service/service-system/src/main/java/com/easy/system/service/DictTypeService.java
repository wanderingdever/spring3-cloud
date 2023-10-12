package com.easy.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.api.service.RemoteDictService;
import com.easy.api.vo.DictTypeVO;
import com.easy.datasource.utils.PageUtil;
import com.easy.redis.constant.CacheConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.system.bean.dto.dict.DictDTO;
import com.easy.system.bean.dto.dict.DictTypeSearchDTO;
import com.easy.system.bean.pojo.DictData;
import com.easy.system.bean.pojo.DictType;
import com.easy.system.dao.DictTypeMapper;
import com.easy.utils.json.JacksonUtil;
import com.easy.utils.lang.StringUtil;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
@DubboService(interfaceClass = RemoteDictService.class)
public class DictTypeService extends ServiceImpl<DictTypeMapper, DictType> implements RemoteDictService {

    private final DictDataService dictDataService;

    /**
     * 初始化系统启用字典到缓存
     */
    public void loadingDictCache() {
        DictTypeSearchDTO dto = new DictTypeSearchDTO();
        dto.setEnable(true);
        dto.setIsSystem(true);
        List<DictType> dictTypeList = getDictList(dto);
        if (StringUtil.isNotEmpty(dictTypeList)) {
            // 设置缓存
            RedisUtils.setCacheObject(CacheConstants.SYSTEM_DICT, JacksonUtil.toJsonString(dictTypeList));
        }
    }

    /**
     * 根据字典类型获取字典
     *
     * @param dictType 字典类型
     * @return {@link DictTypeVO}
     */
    @Override
    public DictTypeVO getDictTypeByDictType(String dictType) {
        // 获取缓存
        List<DictType> dictDataCacheList = getCacheDictList();
        // 缓存没有获取到就查询数据库
        if (CollectionUtils.isEmpty(dictDataCacheList)) {
            DictTypeSearchDTO search = new DictTypeSearchDTO();
            search.setEnable(true);
            search.setIsSystem(true);
            search.setDictType(dictType);
            dictDataCacheList = getDictList(search);
        }
        // 筛选
        Optional<DictType> first = dictDataCacheList.parallelStream().filter(dict -> dict.getDictType().equals(dictType)).findFirst();
        DictType dict = first.orElse(null);
        if (dict != null) {
            DictTypeVO dictVO = new DictTypeVO();
            BeanUtil.copyProperties(dict, dictVO);
            return dictVO;
        }
        return null;
    }

    /**
     * 分页查询字典类型
     *
     * @param dto 查询条件
     * @return {@link Page<DictType>}
     */
    public Page<DictType> pageDictType(DictTypeSearchDTO dto) {
        Page<DictType> page = lambdaQuery()
                .like(StringUtil.isNotBlank(dto.getDictName()), DictType::getDictName, dto.getDictName())
                .eq(StringUtil.isNotBlank(dto.getDictType()), DictType::getDictType, dto.getDictType())
                .eq(StringUtil.isNotNull(dto
                        .getIsSystem()), DictType::getIsSystem, dto.getIsSystem())
                .eq(StringUtil.isNotNull(dto.getEnable()), DictType::getEnable, dto.getEnable())
                .page(PageUtil.getPage(dto));
        page.getRecords().forEach(type -> {
            List<DictData> dataList = dictDataService.lambdaQuery().eq(DictData::getDictTypeId, type.getId()).list();
            type.setDictDataList(dataList);
        });
        return page;
    }

    /**
     * 新增字典类型
     *
     * @param dto 入参
     */
    @Transactional(rollbackFor = Exception.class)
    public void addDictType(DictDTO dto) {
        DictType dictType = new DictType();
        BeanUtils.copyProperties(dto, dictType);
        this.save(dictType);
        // 赋值id 和 type
        dto.getDictDataList().forEach(data -> {
            data.setDictTypeId(dictType.getId());
            data.setDictType(dictType.getDictType());
        });
        List<DictData> dictDataList = BeanUtil.copyToList(dto.getDictDataList(), DictData.class);
        dictDataService.saveBatch(dictDataList);
    }

    /**
     * 更新数据
     *
     * @param dto 字典类型
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateDictType(DictDTO dto) {
    }

    /**
     * 通过ID删除字典类型
     *
     * @param ids id集合
     */
    @Transactional(rollbackFor = Exception.class)
    public void delDictType(List<String> ids) {
        for (String id : ids) {
            // 获取type
            DictType dictType = this.getById(id);
            // 查询出所有关联的data
            LambdaQueryWrapper<DictData> dictDataRmQueryWrapper = new LambdaQueryWrapper<>();
            dictDataRmQueryWrapper.eq(DictData::getDictType, dictType.getDictType());
            // 删除字典
            this.removeById(id);
            // 删除字典数据
            dictDataService.remove(dictDataRmQueryWrapper);
        }
    }

    /**
     * 获取字典集合-包含dict data数据
     *
     * @param search 查询条件
     * @return {@link List<DictType>}
     */
    public List<DictType> getDictList(DictTypeSearchDTO search) {
        // 查询出字典类型
        List<DictType> dictTypeList = lambdaQuery()
                .like(StringUtil.isNotBlank(search.getDictName()), DictType::getDictName, search.getDictName())
                .eq(StringUtil.isNotBlank(search.getDictType()), DictType::getDictType, search.getDictType())
                .eq(StringUtil.isNotNull(search.getIsSystem()), DictType::getIsSystem, search.getIsSystem())
                .eq(StringUtil.isNotNull(search.getEnable()), DictType::getEnable, search.getEnable())
                .list();
        if (StringUtil.isEmpty(dictTypeList)) {
            return null;
        }
        // 查询出所有关联的data
        LambdaQueryWrapper<DictData> dictDataQueryWrapper = new LambdaQueryWrapper<>();
        dictDataQueryWrapper.in(DictData::getDictTypeId,
                dictTypeList.stream().map(DictType::getId).collect(Collectors.toList()));
        List<DictData> dictDataList = dictDataService.list(dictDataQueryWrapper);
        // 组装数据
        dictTypeList.forEach(type ->
                type.setDictDataList(dictDataList.stream().filter(data ->
                        data.getDictTypeId().equals(type.getId())).collect(Collectors.toList())));
        return dictTypeList;
    }

    /**
     * 获取缓存的字典数据
     *
     * @return {@link List<DictType>}
     */
    public List<DictType> getCacheDictList() {
        String cacheObject = RedisUtils.getCacheObject(CacheConstants.SYSTEM_DICT);
        if (StringUtil.isNotBlank(cacheObject)) {
            return JacksonUtil.jsonToList(cacheObject, DictType.class);
        }
        return null;
    }

    public DictType getDictTypeInfoById(String id) {
        DictType dictType = this.baseMapper.selectById(id);
        if (dictType == null) {
            return null;
        }
        List<DictData> dataList = dictDataService.lambdaQuery().eq(DictData::getDictType, dictType.getDictType()).list();
        dictType.setDictDataList(dataList);
        return dictType;
    }
}