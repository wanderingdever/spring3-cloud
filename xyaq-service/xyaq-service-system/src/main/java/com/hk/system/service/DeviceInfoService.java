package com.hk.system.service;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.framework.exception.CustomizeException;
import com.hk.system.bean.dto.device.info.DeviceChangeLocationDTO;
import com.hk.system.bean.dto.device.info.DeviceInfoPageDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.pojo.DeviceLocation;
import com.hk.system.bean.vo.device.info.DeviceInfoPageVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.system.dao.DeviceLocationMapper;
import jakarta.annotation.Resource;
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
        return null;
    }
}