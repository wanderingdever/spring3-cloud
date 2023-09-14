package com.hk.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.utils.PageUtil;
import com.hk.system.bean.dto.DictDataDTO;
import com.hk.system.bean.dto.DictDataSearchDTO;
import com.hk.system.bean.pojo.DictData;
import com.hk.system.dao.DictDataMapper;
import com.hk.utils.lang.StringUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class DictDataService extends ServiceImpl<DictDataMapper, DictData> {

    /**
     * 分页查询字典数据
     *
     * @param search 查询条件
     * @return {@link Page<DictData>}
     */
    public Page<DictData> pageDictData(DictDataSearchDTO search) {
        return this.lambdaQuery()
                .eq(StringUtil.isNotEmpty(search.getDictType()), DictData::getDictType, search.getDictType())
                .like(StringUtil.isNotEmpty(search.getDictLabel()), DictData::getDictLabel, search.getDictLabel())
                .eq(StringUtil.isNotNull(search.getEnable()), DictData::getEnable, search.getEnable())
                .page(PageUtil.getPage(search));
    }

    /**
     * 新增字典数据
     *
     * @param add 新增数据
     */
    @Transactional(rollbackFor = Exception.class)
    public void addDictData(DictDataDTO add) {
        DictData dictData = new DictData();
        BeanUtils.copyProperties(add, dictData);
        this.save(dictData);
    }

    /**
     * 根据ID集合删除字典数据
     *
     * @param ids ID集合
     */
    @Transactional(rollbackFor = Exception.class)
    public void delDictData(List<String> ids) {
        removeByIds(ids);
    }

    /**
     * 更新数据
     *
     * @param update 更新数据
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateDictData(DictData update) {
        this.updateById(update);
    }
}