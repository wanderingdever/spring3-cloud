package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.datasource.utils.PageUtil;
import com.hk.system.bean.dto.device.info.DeviceInfoPageDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.vo.device.info.DeviceInfoVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.web.exception.CustomizeException;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

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

    public void del(IdDTO dto) {

        // 删除区域
        this.removeById(dto.getId());
    }

    public DeviceInfo getDevice(String id) {
        return getDevice(List.of(id)).get(0);
    }

    public List<DeviceInfo> getDevice(List<String> idList) {

        HashSet<String> idSet = new HashSet<>(idList);
        List<DeviceInfo> list = lambdaQuery().in(DeviceInfo::getId, idSet).list();
        if (list.size() != idSet.size()) {
            throw new CustomizeException("设备不存在");
        }
        return list;
    }
}