package com.hk.system.manager;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.hk.system.bean.dto.device.info.DeviceInfoAddDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationMountedDeviceDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.service.DeviceInfoService;
import com.hk.system.service.DeviceLocationService;
import com.hk.system.service.OrgService;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DeviceManager {

    @Resource
    private OrgService orgService;

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

    public void add(DeviceInfoAddDTO dto) {

        orgService.getOrg(dto.getOrgId());
        Condition.of(dto.getDeviceLocationId(), StringUtils::isNotBlank).handle(k -> deviceLocationService.getLocation(dto.getDeviceLocationId()));
        deviceInfoService.save(toDeviceInfo(dto));
    }

    private DeviceInfo toDeviceInfo(DeviceInfoAddDTO dto) {

        DeviceInfo deviceInfo = new DeviceInfo();
        BeanUtil.copyProperties(dto, deviceInfo);
        Condition.of(dto.getLabelList(), CollectionUtils::isNotEmpty).handle(k -> deviceInfo.setLabel(String.join(",", dto.getLabelList())));
        return deviceInfo;
    }
}