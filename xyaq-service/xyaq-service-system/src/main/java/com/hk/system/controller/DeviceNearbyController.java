package com.hk.system.controller;

import com.hk.datasource.bean.dto.IdDTO;
import com.hk.system.bean.dto.device.nearby.DeviceNearbyAddDTO;
import com.hk.system.bean.vo.device.nearby.DeviceInfoNearbyVO;
import com.hk.system.manager.DeviceManager;
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
 * <p>设备周边关系</p>
 *
 * @author 小徐
 * @since 2023/9/14 14:53
 */
@Tag(name = "设备周边关系")
@Slf4j
@RestController
@RequestMapping("/device-nearby")
public class DeviceNearbyController {

    @Resource
    private DeviceManager deviceManager;

    @PostMapping("/add")
    @Operation(summary = "新增周边设备关系", description = "新增周边设备关系")
    public void add(@RequestBody @Valid DeviceNearbyAddDTO dto) {

        deviceManager.addDeviceNearby(dto);
    }

    @PostMapping("/list")
    @Operation(summary = "周边设备列表", description = "周边设备列表")
    public List<DeviceInfoNearbyVO> list(@RequestBody @Valid IdDTO dto) {

        return deviceManager.listDeviceNearby(dto);
    }
}