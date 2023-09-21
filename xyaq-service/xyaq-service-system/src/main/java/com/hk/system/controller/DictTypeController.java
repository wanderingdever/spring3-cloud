package com.hk.system.controller;


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hk.api.vo.DictTypeVO;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.framework.exception.CustomizeException;
import com.hk.system.bean.dto.DictDataSearchDTO;
import com.hk.system.bean.dto.DictTypeDTO;
import com.hk.system.bean.dto.DictTypeSearchDTO;
import com.hk.system.bean.pojo.DictType;
import com.hk.system.service.DictTypeService;
import com.hk.utils.lang.StringUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;


/**
 * 字典类型
 * <p>
 * 2022/1/13 18:05
 *
 * @author Matt
 */
@Tag(name = "字典类型")
@RestController
@RequestMapping("/dictType")
public class DictTypeController {


    private final DictTypeService dictTypeService;

    public DictTypeController(DictTypeService dictTypeService) {
        this.dictTypeService = dictTypeService;
    }

    /**
     * 重载缓存
     */
    @PostMapping(value = "/overload")
    @Operation(description = "重载字典缓存")
    public void overloadDict() {
        dictTypeService.loadingDictCache();
    }

    /**
     * 获取字典类型以及其下的字典数据
     *
     * @param dto 字典类型
     * @return 字典数据
     */
    @PostMapping("/dict_by_type")
    @Operation(description = "获取字典类型以及其下的字典数据")
    public DictTypeVO getDictTypeByDictType(@RequestBody DictDataSearchDTO dto) {
        if (StringUtil.isBlank(dto.getDictType())) {
            throw new CustomizeException("字典类型不能为空");
        }
        return dictTypeService.getDictTypeByDictType(dto.getDictType());
    }

    /**
     * 查询字典类型详细
     *
     * @param dto 主键
     * @return 字典类型信息
     */
    @PostMapping(value = "/get")
    @Operation(description = "获取字典类型详情")
    public DictType getDictTypeInfo(@Valid @RequestBody IdDTO dto) {
        return dictTypeService.getById(dto.getId());
    }

    /**
     * 集合查询
     *
     * @param dto 查询入参
     * @return 集合数据
     */
    @PostMapping(value = "/list")
    @Operation(description = "集合查询")
    public List<DictType> listDictType(@RequestBody DictTypeSearchDTO dto) {
        return dictTypeService.listDictType(dto);
    }

    /**
     * 分页查询
     *
     * @param dto 查询入参
     * @return 分页数据
     */
    @PostMapping(value = "/page")
    @Operation(description = "分页查询")
    @SaCheckPermission("system.dictType.page")
    public Page<DictType> pageDictType(@RequestBody DictTypeSearchDTO dto) {
        return dictTypeService.pageDictType(dto);
    }


    /**
     * 新增字典类型
     *
     * @param dto 新增入参
     */
    @PostMapping(value = "/add")
    @Operation(description = "新增字典类型")
    @SaCheckPermission("system.dictType.add")
    public String addDictType(@Valid @RequestBody DictTypeDTO dto) {
        dictTypeService.addDictType(dto);
        return "";
    }

    /**
     * 更新字典类型
     *
     * @param dictType 字典信息
     */
    @PostMapping(value = "/update")
    @Operation(description = "修改字典类型")
    @SaCheckPermission("system.dictType.update")
    public String updateDictType(@Valid @RequestBody DictType dictType) {
        dictTypeService.updateDictType(dictType);
        return "";
    }

    /**
     * 删除字典类型
     *
     * @param ids 主键集合
     */
    @PostMapping(value = "/del")
    @Operation(description = "删除字典类型")
    @SaCheckPermission("system.dictType.del")
    public String delDictType(@RequestBody List<String> ids) {
        dictTypeService.delDictType(ids);
        return "";
    }
}