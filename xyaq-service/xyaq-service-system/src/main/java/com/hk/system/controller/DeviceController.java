package com.hk.system.controller;

import com.hk.system.bean.vo.device.location.DeviceLocationMountedDeviceDTO;
import com.hk.system.manager.DeviceManager;
import com.hk.web.exception.CustomizeException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>设备</p>
 *
 * @author 小徐
 * @since 2023/9/14 10:22
 */
@Tag(name = "设备")
@Slf4j
@RestController
@RequestMapping("/device")
public class DeviceController {

    @Resource
    private DeviceManager deviceManager;

    @PostMapping("/mounted-device")
    @Operation(summary = "挂载设备", description = "挂载设备")
    public void mountedDevice(@RequestBody @Valid DeviceLocationMountedDeviceDTO dto) {

        if (CollectionUtils.isEmpty(dto.getDeviceIdList())) {
            throw new CustomizeException("请选择设备");
        }
        deviceManager.mountedDevice(dto);
    }
}