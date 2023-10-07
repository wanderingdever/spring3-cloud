package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.datasource.utils.PageUtil;
import com.hk.framework.exception.CustomizeException;
import com.hk.satoken.service.DataScopeService;
import com.hk.system.bean.dto.device.info.DeviceInfoPageDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.vo.device.info.DeviceInfoVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.utils.Condition;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class DeviceInfoService extends ServiceImpl<DeviceInfoMapper, DeviceInfo> {

    @Resource
    private DataScopeService dataScopeService;

    public Page<DeviceInfoVO> page(DeviceInfoPageDTO dto) {

        Page<DeviceInfo> deviceInfoPage = lambdaQuery()
                .in(DeviceInfo::getOrgId, dataScopeService.authorizedOrgIdList())
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
        Condition.of(deviceInfo.getLabel(), StringUtils::isNotBlank).handle(k -> vo.setLabelList(Arrays.asList(deviceInfo.getLabel().split(","))));
        return vo;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdDTO dto) {

        DeviceInfo deviceInfo = this.lambdaQuery()
                .eq(DeviceInfo::getId, dto.getId())
                .in(DeviceInfo::getOrgId, dataScopeService.authorizedOrgIdList())
                .one();
        if (null == deviceInfo) {
            throw new CustomizeException("设备不存在");
        }
        this.removeById(dto.getId());
    }

    public DeviceInfo getDevice(String id) {
        return getDevice(List.of(id)).get(0);
    }

    public List<DeviceInfo> getDevice(Collection<String> idColl) {

        HashSet<String> idSet = idColl instanceof HashSet ? (HashSet<String>) idColl : new HashSet<>(idColl);
        List<DeviceInfo> list = lambdaQuery()
                .in(DeviceInfo::getId, idSet)
                .in(DeviceInfo::getOrgId, dataScopeService.authorizedOrgIdList())
                .list();
        if (list.size() != idSet.size()) {
            throw new CustomizeException("设备不存在");
        }
        return list;
    }
}