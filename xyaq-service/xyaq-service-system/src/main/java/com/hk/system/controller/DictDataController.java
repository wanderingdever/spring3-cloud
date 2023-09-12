package com.hk.system.controller;


import com.hk.system.service.DictDataService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 字典数据
 * <p>
 * 2022/1/13 18:05
 *
 * @author Matt
 */
@RestController
@RequestMapping("/dictData")
@Tag(name = "字典数据")
public class DictDataController {

    private final DictDataService dictDataService;

    public DictDataController(DictDataService dictDataService) {
        this.dictDataService = dictDataService;
    }


}