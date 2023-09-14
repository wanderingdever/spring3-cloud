package com.hk.system.controller;

import com.hk.datasource.bean.dto.IdDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationAddDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationTreeDTO;
import com.hk.system.bean.vo.device.location.DeviceLocationEditDTO;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeVO;
import com.hk.system.bean.vo.device.location.DeviceLocationVO;
import com.hk.system.service.DeviceLocationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>设备位置</p>
 *
 * @author 小徐
 * @since 2023/9/12 13:38
 */
@Tag(name = "区域")
@Slf4j
@RestController
@RequestMapping("/device-location")
public class DeviceLocationController {

    @Resource
    private DeviceLocationService deviceLocationService;

    @PostMapping("/add")
    @Operation(summary = "新增区域", description = "新增区域")
    public void add(@RequestBody @Valid DeviceLocationAddDTO dto) {
        deviceLocationService.add(dto);
    }

    @PostMapping("/del")
    @Operation(summary = "删除区域", description = "使用 Id 删除区域")
    public void del(@RequestBody @Valid IdDTO dto) {
        deviceLocationService.del(dto);
    }

    @PostMapping("/tree")
    @Operation(summary = "查询区域树", description = "使用 orgId 查询机构下的树")
    public List<DeviceLocationTreeVO> tree(@RequestBody @Valid DeviceLocationTreeDTO dto) {
        return deviceLocationService.tree(dto);
    }

    @PostMapping("/info")
    @Operation(summary = "查询区域", description = "使用 Id 查询详情")
    public DeviceLocationVO info(@RequestBody @Valid IdDTO dto) {
        return deviceLocationService.info(dto);
    }

    @PostMapping("/edit")
    @Operation(summary = "编辑区域", description = "编辑区域")
    public void edit(@RequestBody @Valid DeviceLocationEditDTO dto) {
        deviceLocationService.edit(dto);
    }
}