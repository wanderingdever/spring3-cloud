package com.hk.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoAddDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoEditDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoPageDTO;
import com.hk.system.bean.vo.device.info.DeviceInfoVO;
import com.hk.system.manager.DeviceManager;
import com.hk.system.service.DeviceInfoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>设备信息</p>
 *
 * @author 小徐
 * @since 2023/9/13 11:39
 */
@Tag(name = "设备信息")
@Slf4j
@RestController
@RequestMapping("/device-info")
public class DeviceInfoController {

    @Resource
    private DeviceInfoService deviceInfoService;

    @Resource
    private DeviceManager deviceManager;

    @PostMapping("/add-device")
    @Operation(summary = "新增设备", description = "新增设备")
    public void addDevice(@RequestBody @Valid DeviceInfoAddDTO dto) {
        deviceManager.addDevice(dto);
    }

    @PostMapping("/page")
    @Operation(summary = "分页查询设备信息", description = "设备信息分页查询")
    public Page<DeviceInfoVO> page(@RequestBody @Valid DeviceInfoPageDTO dto) {
        return deviceInfoService.page(dto);
    }

    @PostMapping("/del")
    @Operation(summary = "删除设备", description = "使用 Id 删除设备")
    public void del(@RequestBody @Valid IdDTO dto) {
        deviceInfoService.del(dto);
    }

    @PostMapping("/edit")
    @Operation(summary = "编辑设备", description = "编辑设备")
    public void edit(@RequestBody @Valid DeviceInfoEditDTO dto) {
        deviceManager.editDevice(dto);
    }
}