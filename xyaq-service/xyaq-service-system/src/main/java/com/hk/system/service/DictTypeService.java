package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.api.service.RemoteDictService;
import com.hk.api.vo.DictTypeVO;
import com.hk.datasource.utils.PageUtil;
import com.hk.framework.bean.base.BaseEntity;
import com.hk.framework.enums.YesOrNo;
import com.hk.framework.exception.CustomizeException;
import com.hk.redis.constant.CacheConstants;
import com.hk.redis.utils.RedisUtils;
import com.hk.system.bean.dto.DictTypeDTO;
import com.hk.system.bean.dto.DictTypeSearchDTO;
import com.hk.system.bean.pojo.DictData;
import com.hk.system.bean.pojo.DictType;
import com.hk.system.dao.DictDataMapper;
import com.hk.system.dao.DictTypeMapper;
import com.hk.utils.json.JacksonUtil;
import com.hk.utils.lang.StringUtil;
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

    private final DictDataMapper dictDataMapper;

    /**
     * 初始化系统启用字典到缓存
     */
    public void loadingDictCache() {
        DictTypeSearchDTO dto = new DictTypeSearchDTO();
        dto.setEnable(YesOrNo.YES);
        dto.setIsSystem(YesOrNo.YES);
        List<DictType> dictTypeList = getDictList(dto);
        if (StringUtil.isNotEmpty(dictTypeList)) {
            // 设置缓存
            RedisUtils.setCacheObject(CacheConstants.SYSTEM_DICT, JacksonUtil.toJsonString(dictTypeList));
        }
    }

    /**
     * 查询字典列表
     *
     * @param search 查询条件
     * @return {@link List<DictType>}
     */
    public List<DictType> listDictType(DictTypeSearchDTO search) {
        return lambdaQuery()
                .like(StringUtil.isNotEmpty(search.getDictName()), DictType::getDictName, search.getDictName())
                .eq(StringUtil.isNotBlank(search.getDictType()), DictType::getDictType, search.getDictType())
                .eq(StringUtil.isNotNull(search.getIsSystem()), DictType::getIsSystem, search.getIsSystem())
                .eq(StringUtil.isNotNull(search.getEnable()), DictType::getEnable, search.getEnable())
                .list();
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
            search.setEnable(YesOrNo.YES);
            search.setIsSystem(YesOrNo.YES);
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
        return lambdaQuery()
                .like(StringUtil.isNotBlank(dto.getDictName()), DictType::getDictName, dto.getDictName())
                .eq(StringUtil.isNotBlank(dto.getDictType()), DictType::getDictType, dto.getDictType())
                .eq(StringUtil.isNotNull(dto.getIsSystem()), DictType::getIsSystem, dto.getIsSystem())
                .eq(StringUtil.isNotNull(dto.getEnable()), DictType::getEnable, dto.getEnable())
                .page(PageUtil.getPage(dto));
    }

    /**
     * 新增字典类型
     *
     * @param dto 入参
     */
    @Transactional(rollbackFor = Exception.class)
    public void addDictType(DictTypeDTO dto) {
        DictType dictType = new DictType();
        BeanUtils.copyProperties(dto, dictType);
        this.save(dictType);
    }

    /**
     * 更新数据
     *
     * @param dictType 字典类型
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateDictType(DictType dictType) {
        this.updateById(dictType);
    }

    /**
     * 通过ID删除字典类型
     *
     * @param ids id集合
     */
    @Transactional(rollbackFor = Exception.class)
    public void delDictType(List<String> ids) {
        for (String id : ids) {
            DictType dictType = this.getById(id);
            // 查询出所有关联的data
            LambdaQueryWrapper<DictData> dictDataCountQueryWrapper = new LambdaQueryWrapper<>();
            dictDataCountQueryWrapper.eq(DictData::getDictType, dictType.getDictType());
            if (dictDataMapper.selectCount(dictDataCountQueryWrapper) > 0) {
                throw new CustomizeException(String.format("%1$s已分配,不能删除", dictType.getDictName()));
            } else {
                // 删除字典
                this.removeById(id);
                // 删除字典数据
                LambdaQueryWrapper<DictData> dictDataRmQueryWrapper = new LambdaQueryWrapper<>();
                dictDataRmQueryWrapper.eq(DictData::getDictType, dictType.getDictType());
                dictDataMapper.delete(dictDataRmQueryWrapper);
            }
        }
    }

    /**
     * 获取字典集合
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
        dictDataQueryWrapper.eq(DictData::getDictType,
                dictTypeList.stream().map(BaseEntity::getId).collect(Collectors.toList()));
        List<DictData> dictDataList = dictDataMapper.selectList(dictDataQueryWrapper);
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

}