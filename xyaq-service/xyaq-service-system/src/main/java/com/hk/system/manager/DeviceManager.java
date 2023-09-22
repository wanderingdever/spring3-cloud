package com.hk.system.manager;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.framework.enums.DelEnum;
import com.hk.satoken.service.DataScopeService;
import com.hk.system.bean.dto.device.info.DeviceInfoAddDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoEditDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationMountedDeviceDTO;
import com.hk.system.bean.dto.device.nearby.DeviceNearbyAddDTO;
import com.hk.system.bean.dto.device.relation.DeviceRelationAddDTO;
import com.hk.system.bean.dto.device.relation.DeviceRelationAddMountedDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.pojo.DeviceNearby;
import com.hk.system.bean.pojo.DeviceRelation;
import com.hk.system.bean.vo.device.nearby.DeviceInfoNearbyVO;
import com.hk.system.bean.vo.device.relation.DeviceInfoRelationVO;
import com.hk.system.service.*;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Component
public class DeviceManager {

    @Resource
    private OrgService orgService;

    @Resource
    private DeviceInfoService deviceInfoService;

    @Resource
    private DeviceNearbyService deviceNearbyService;

    @Resource
    private DeviceLocationService deviceLocationService;

    @Resource
    private DeviceRelationService deviceRelationService;

    @Resource
    private DataScopeService dataScopeService;

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void mountedDevice(DeviceLocationMountedDeviceDTO dto) {

        deviceLocationService.getLocation(List.of(dto.getLocationId()));
        deviceInfoService.getDevice(dto.getDeviceIdList());
        // 更改设备区域
        LambdaUpdateWrapper<DeviceInfo> deviceInfoLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        deviceInfoLambdaUpdateWrapper.in(DeviceInfo::getId, dto.getDeviceIdList());
        deviceInfoLambdaUpdateWrapper.set(DeviceInfo::getDeviceLocationId, dto.getLocationId());
        deviceInfoLambdaUpdateWrapper.set(DeviceInfo::getOrgId, dataScopeService.authorizedOrgIdList());
        deviceInfoService.update(deviceInfoLambdaUpdateWrapper);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void addDevice(DeviceInfoAddDTO dto) {

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

    public List<DeviceInfoNearbyVO> listDeviceNearby(IdDTO dto) {

        List<DeviceNearby> list = deviceNearbyService.lambdaQuery()
                .eq(DeviceNearby::getDeviceId, dto.getId())
                .or()
                .eq(DeviceNearby::getNearbyDeviceId, dto.getId())
                .list();
        Set<String> deviceIdSet = list.stream()
                .map(k -> List.of(k.getNearbyDeviceId(), k.getDeviceId()))
                .flatMap(Collection::stream)
                .collect(Collectors.toSet());
        deviceIdSet.remove(dto.getId());

        List<DeviceInfo> deviceInfoList = deviceInfoService.lambdaQuery()
                .in(DeviceInfo::getId, deviceIdSet)
                .list();

        return deviceInfoList.stream()
                .map(k -> toDeviceInfoNearbyVO(k, deviceIdSet))
                .toList();
    }

    private DeviceInfoNearbyVO toDeviceInfoNearbyVO(DeviceInfo deviceInfo, Set<String> deviceIdSet) {

        DeviceInfoNearbyVO vo = new DeviceInfoNearbyVO();
        BeanUtil.copyProperties(deviceInfo, vo);
        vo.setNearby(deviceIdSet.contains(vo.getId()));
        return vo;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void addDeviceNearby(DeviceNearbyAddDTO dto) {

        List<String> idList = new ArrayList<>(dto.getNearbyIdList());
        idList.add(dto.getDeviceId());
        deviceInfoService.getDevice(idList);

        deviceNearbyService.lambdaUpdate()
                .and(k -> k.eq(DeviceNearby::getDeviceId, dto.getDeviceId())
                        .or()
                        .eq(DeviceNearby::getNearbyDeviceId, dto.getDeviceId()))
                .set(DeviceNearby::getDel, DelEnum.DELETE.getCode())
                .update();

        List<DeviceNearby> nearbyList = new ArrayList<>();
        for (String s : dto.getNearbyIdList()) {
            DeviceNearby nearby = new DeviceNearby();
            nearby.setDeviceId(dto.getDeviceId());
            nearby.setNearbyDeviceId(s);
            nearbyList.add(nearby);
        }
        deviceNearbyService.saveBatch(nearbyList);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void addRelation(DeviceRelationAddDTO dto) {

        Set<String> idSet = dto.getMountedList().stream().map(DeviceRelationAddMountedDTO::getMountedDeviceId).collect(Collectors.toSet());
        idSet.add(dto.getDeviceId());
        deviceInfoService.getDevice(idSet);
        deviceRelationService.lambdaUpdate()
                .eq(DeviceRelation::getDeviceId, dto.getDeviceId())
                .set(DeviceRelation::getDel, DelEnum.DELETE.getCode())
                .update();

        List<DeviceRelation> deviceRelationList = dto.getMountedList().stream().map(k -> {
            DeviceRelation relation = new DeviceRelation();
            relation.setDeviceId(dto.getDeviceId());
            relation.setMountedDeviceId(k.getMountedDeviceId());
            relation.setDeviceChannel(k.getDeviceChannel());
            return relation;
        }).toList();
        deviceRelationService.saveBatch(deviceRelationList);
    }

    public List<DeviceInfoRelationVO> listRelation(IdDTO dto) {

        List<DeviceRelation> list = deviceRelationService.lambdaQuery()
                .eq(DeviceRelation::getDeviceId, dto.getId())
                .or()
                .eq(DeviceRelation::getMountedDeviceId, dto.getId())
                .list();
        Set<String> deviceIdSet = list.stream()
                .map(k -> List.of(k.getDeviceId(), k.getMountedDeviceId()))
                .flatMap(Collection::stream)
                .collect(Collectors.toSet());

        List<DeviceInfo> deviceInfoList = deviceInfoService.getDevice(deviceIdSet);

        return deviceInfoList.stream()
                .map(k -> toDeviceInfoRelationVO(k, deviceIdSet))
                .toList();
    }

    private DeviceInfoRelationVO toDeviceInfoRelationVO(DeviceInfo deviceInfo, Set<String> deviceIdSet) {

        DeviceInfoRelationVO vo = new DeviceInfoRelationVO();
        BeanUtil.copyProperties(deviceInfo, vo);
        vo.setRelation(deviceIdSet.contains(vo.getId()));
        return vo;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void editDevice(DeviceInfoEditDTO dto) {

        deviceInfoService.getDevice(dto.getId());
        if (StringUtils.isNotBlank(dto.getOrgId())) {
            orgService.getOrg(dto.getOrgId());
        }
        if (StringUtils.isNotBlank(dto.getDeviceLocationId())) {
            deviceLocationService.getLocation(dto.getDeviceLocationId());
        }
        // 编辑
        deviceInfoService.lambdaUpdate()
                .in(DeviceInfo::getOrgId, dataScopeService.authorizedOrgIdList())
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