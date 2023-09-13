package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.datasource.utils.PageUtil;
import com.hk.framework.exception.CustomizeException;
import com.hk.system.bean.dto.device.info.DeviceChangeLocationDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoPageDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.pojo.DeviceLocation;
import com.hk.system.bean.vo.device.info.DeviceInfoPageVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.system.dao.DeviceLocationMapper;
import jakarta.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class DeviceInfoService extends ServiceImpl<DeviceInfoMapper, DeviceInfo> {

    @Resource
    private DeviceLocationMapper deviceLocationMapper;

    public void changeLocation(DeviceChangeLocationDTO dto) {

        // 验证区域是否存在
        DeviceLocation deviceLocation = deviceLocationMapper.selectById(dto.getLocationId());
        if (Objects.isNull(deviceLocation)) {
            throw new CustomizeException("区域不存在");
        }

        // 验证设备是否存在
        DeviceInfo deviceInfo = this.baseMapper.selectById(dto.getDeviceId());
        if (Objects.isNull(deviceInfo)) {
            throw new CustomizeException("设备不存在");
        }

        // 更改设备区域
        LambdaUpdateWrapper<DeviceInfo> deviceInfoLambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        deviceInfoLambdaUpdateWrapper.eq(DeviceInfo::getId, dto.getDeviceId());
        deviceInfoLambdaUpdateWrapper.set(DeviceInfo::getDeviceLocationId, dto.getLocationId());
        this.update(deviceInfoLambdaUpdateWrapper);
    }

    public Page<DeviceInfoPageVO> page(DeviceInfoPageDTO dto) {

        Page<DeviceInfo> deviceInfoPage = lambdaQuery()
                .eq(StringUtils.isNotBlank(dto.getType()), DeviceInfo::getType, dto.getType())
                .like(StringUtils.isNotBlank(dto.getCode()), DeviceInfo::getCode, dto.getCode())
                .and(StringUtils.isNotBlank(dto.getKeyword()), a -> a.like(DeviceInfo::getCode, dto.getKeyword())
                        .or().like(DeviceInfo::getName, dto.getKeyword())
                        .or().like(DeviceInfo::getLatitude, dto.getKeyword())
                        .or().like(DeviceInfo::getLongitude, dto.getKeyword())
                        .or().like(DeviceInfo::getIp, dto.getKeyword())
                        .or().like(DeviceInfo::getAccount, dto.getKeyword()))
                .page(PageUtil.getPage(dto));
        return PageUtil.getPage(deviceInfoPage, this::toDeviceInfoPageVO);
    }

    private DeviceInfoPageVO toDeviceInfoPageVO(DeviceInfo deviceInfo) {

        DeviceInfoPageVO vo = new DeviceInfoPageVO();
        BeanUtil.copyProperties(deviceInfo, vo);
        return vo;
    }

    public void del(IdDTO dto) {

        // 删除区域
        this.removeById(dto.getId());
    }
}