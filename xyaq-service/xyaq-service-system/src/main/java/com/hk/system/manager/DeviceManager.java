package com.hk.system.manager;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.hk.system.bean.dto.device.info.DeviceInfoAddDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoEditDTO;
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
import java.util.Objects;

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

    public void edit(DeviceInfoEditDTO dto) {

        deviceInfoService.getDevice(dto.getId());
        // 编辑
        deviceInfoService.lambdaUpdate()
                .eq(DeviceInfo::getId, dto.getId())
                .set(StringUtils.isNotBlank(dto.getOrgId()), DeviceInfo::getOrgId, dto.getOrgId())
                .set(StringUtils.isNotBlank(dto.getDeviceLocationId()), DeviceInfo::getDeviceLocationId, dto.getDeviceLocationId())
                .set(StringUtils.isNotBlank(dto.getType()), DeviceInfo::getType, dto.getType())
                .set(StringUtils.isNotBlank(dto.getCode()), DeviceInfo::getCode, dto.getCode())
                .set(StringUtils.isNotBlank(dto.getName()), DeviceInfo::getName, dto.getName())
                .set(StringUtils.isNotBlank(dto.getShortName()), DeviceInfo::getShortName, dto.getShortName())
                .set(StringUtils.isNotBlank(dto.getBrand()), DeviceInfo::getBrand, dto.getBrand())
                .set(CollectionUtils.isNotEmpty(dto.getLabelList()), DeviceInfo::getLabel, dto.getLabel())
                .set(StringUtils.isNotBlank(dto.getLongitude()), DeviceInfo::getLongitude, dto.getLongitude())
                .set(StringUtils.isNotBlank(dto.getLatitude()), DeviceInfo::getLatitude, dto.getLatitude())
                .set(StringUtils.isNotBlank(dto.getIp()), DeviceInfo::getIp, dto.getIp())
                .set(StringUtils.isNotBlank(dto.getIdentification()), DeviceInfo::getIdentification, dto.getIdentification())
                .set(StringUtils.isNotBlank(dto.getAccount()), DeviceInfo::getAccount, dto.getAccount())
                .set(StringUtils.isNotBlank(dto.getPassword()), DeviceInfo::getPassword, dto.getPassword())
                .set(StringUtils.isNotBlank(dto.getLinkGbPlatform()), DeviceInfo::getLinkGbPlatform, dto.getLinkGbPlatform())
                .set(StringUtils.isNotBlank(dto.getRemark()), DeviceInfo::getRemark, dto.getRemark())
                .set(Objects.nonNull(dto.getSort()), DeviceInfo::getSort, dto.getSort())
                .update();
    }
}