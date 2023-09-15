package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.datasource.utils.PageUtil;
import com.hk.system.bean.dto.device.info.DeviceInfoEditDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoPageDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.vo.device.info.DeviceInfoVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.web.exception.CustomizeException;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class DeviceInfoService extends ServiceImpl<DeviceInfoMapper, DeviceInfo> {

    public Page<DeviceInfoVO> page(DeviceInfoPageDTO dto) {

        Page<DeviceInfo> deviceInfoPage = lambdaQuery()
                .eq(StringUtils.isNotBlank(dto.getType()), DeviceInfo::getType, dto.getType())
                .like(StringUtils.isNotBlank(dto.getName()), DeviceInfo::getName, dto.getName())
                .like(StringUtils.isNotBlank(dto.getShortName()), DeviceInfo::getShortName, dto.getShortName())
                .like(StringUtils.isNotBlank(dto.getDeviceLocationId()), DeviceInfo::getDeviceLocationId, dto.getDeviceLocationId())
                .like(StringUtils.isNotBlank(dto.getIp()), DeviceInfo::getIp, dto.getIp())
                .and(CollectionUtils.isNotEmpty(dto.getLabelList()), a -> dto.getLabelList().forEach(k -> a.like(DeviceInfo::getLabel, k).or()))
                .and(StringUtils.isNotBlank(dto.getKeyword()), a -> a.like(DeviceInfo::getCode, dto.getKeyword())
                        .or().like(DeviceInfo::getName, dto.getKeyword())
                        .or().like(DeviceInfo::getShortName, dto.getKeyword())
                        .or().like(DeviceInfo::getLabel, dto.getKeyword())
                        .or().like(DeviceInfo::getLatitude, dto.getKeyword())
                        .or().like(DeviceInfo::getLongitude, dto.getKeyword())
                        .or().like(DeviceInfo::getIp, dto.getKeyword())
                        .or().like(DeviceInfo::getAccount, dto.getKeyword()))
                .page(PageUtil.getPage(dto));
        return PageUtil.getPage(deviceInfoPage, this::toDeviceInfoPageVO);
    }

    private DeviceInfoVO toDeviceInfoPageVO(DeviceInfo deviceInfo) {

        DeviceInfoVO vo = new DeviceInfoVO();
        BeanUtil.copyProperties(deviceInfo, vo);
        return vo;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdDTO dto) {

        this.removeById(dto.getId());
    }

    public DeviceInfo getDevice(String id) {
        return getDevice(List.of(id)).get(0);
    }

    public List<DeviceInfo> getDevice(Collection<String> idColl) {

        HashSet<String> idSet = idColl instanceof HashSet ? (HashSet<String>) idColl : new HashSet<>(idColl);
        List<DeviceInfo> list = lambdaQuery().in(DeviceInfo::getId, idSet).list();
        if (list.size() != idSet.size()) {
            throw new CustomizeException("设备不存在");
        }
        return list;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void edit(DeviceInfoEditDTO dto) {

        getDevice(dto.getId());
        // 编辑
        lambdaUpdate()
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