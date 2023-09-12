package com.hk.system.controller;


import com.hk.system.service.DictTypeService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


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

}