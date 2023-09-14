package com.hk.system.manager;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.vo.device.location.DeviceLocationMountedDeviceDTO;
import com.hk.system.service.DeviceInfoService;
import com.hk.system.service.DeviceLocationService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DeviceManager {

    @Resource
    private DeviceInfoService deviceInfoService;

    @Resource
    private DeviceLocationService deviceLocationService;

    public void mountedDevice(DeviceLocationMountedDeviceDTO dto) {

        deviceLocationService.getLocation(List.of(dto.getLocationId()));
        deviceInfoService.getDevice(dto.getDeviceIdList());
        // 更改设备区域
        LambdaUpdateWrapper<DeviceInfo> deviceInfoLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        deviceInfoLambdaUpdateWrapper.in(DeviceInfo::getId, dto.getDeviceIdList());
        deviceInfoLambdaUpdateWrapper.set(DeviceInfo::getDeviceLocationId, dto.getLocationId());
        deviceInfoService.update(deviceInfoLambdaUpdateWrapper);
    }
}