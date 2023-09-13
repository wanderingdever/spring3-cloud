package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.framework.exception.CustomizeException;
import com.hk.system.bean.dto.IdDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationTreeDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.pojo.DeviceLocation;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeVO;
import com.hk.system.bean.vo.device.location.DeviceLocationVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.system.dao.DeviceLocationMapper;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class DeviceLocationService extends ServiceImpl<DeviceLocationMapper, DeviceLocation> {

    @Resource
    private DeviceInfoMapper deviceInfoMapper;

    public List<DeviceLocationTreeVO> tree(DeviceLocationTreeDTO dto) {

        LambdaQueryWrapper<DeviceLocation> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(StringUtils.isNotBlank(dto.getOrgId()), DeviceLocation::getOrgId, dto.getOrgId());
        List<DeviceLocation> list = list(lambdaQueryWrapper);
        return buildTree(list);
    }

    private List<DeviceLocationTreeVO> buildTree(List<DeviceLocation> list) {

        if (CollectionUtils.isEmpty(list)) {
            return new ArrayList<>();
        }
        // 分离数据
        List<DeviceLocationTreeVO> rootList = list.stream()
                .filter(deviceLocation -> deviceLocation.getOrgId().equals(deviceLocation.getParentId()))
                .map(this::toDeviceLocationTreeVO)
                .toList();
        Map<String, List<DeviceLocationTreeVO>> leafMap = list.stream()
                .map(this::toDeviceLocationTreeVO)
                .collect(Collectors.groupingBy(DeviceLocationTreeVO::getParentId));

        // 组装数据
        buildBranch(rootList, leafMap);
        return rootList;
    }

    private void buildBranch(List<DeviceLocationTreeVO> rootList, Map<String, List<DeviceLocationTreeVO>> leafMap) {

        if (CollectionUtils.isEmpty(rootList)) {
            return;
        }
        for (DeviceLocationTreeVO deviceLocationTree : rootList) {
            List<DeviceLocationTreeVO> deviceLocations = leafMap.get(deviceLocationTree.getId());
            leafMap.remove(deviceLocationTree.getId());
            deviceLocationTree.setChildren(deviceLocations);
            buildBranch(deviceLocations, leafMap);
        }
    }

    private DeviceLocationTreeVO toDeviceLocationTreeVO(DeviceLocation deviceLocation) {
        DeviceLocationTreeVO vo = new DeviceLocationTreeVO();
        BeanUtil.copyProperties(deviceLocation, vo);
        vo.setChildren(new ArrayList<>());
        return vo;
    }

    public DeviceLocationVO info(IdDTO dto) {

        DeviceLocation deviceLocation = this.baseMapper.selectById(dto.getId());
        if (Objects.isNull(deviceLocation)) {
            throw new CustomizeException("区域不存在");
        }
        return toDeviceLocationVO(deviceLocation);
    }

    private DeviceLocationVO toDeviceLocationVO(DeviceLocation deviceLocation) {
        DeviceLocationVO vo = new DeviceLocationVO();
        BeanUtil.copyProperties(deviceLocation, vo);
        return vo;
    }

    public void del(IdDTO dto) {

        // 有下级区域不允许删除
        LambdaQueryWrapper<DeviceLocation> selectLambdaQueryWrapper = new LambdaQueryWrapper<>();
        selectLambdaQueryWrapper.eq(DeviceLocation::getParentId, dto.getId());
        List<DeviceLocation> list = list(selectLambdaQueryWrapper);
        if (CollectionUtils.isNotEmpty(list)) {
            throw new CustomizeException("存在下级区域，不允许删除");
        }

        // 有挂载设备不允许删除
        LambdaQueryWrapper<DeviceInfo> deviceInfoLambdaQueryWrapper = new LambdaQueryWrapper<>();
        deviceInfoLambdaQueryWrapper.eq(DeviceInfo::getDeviceLocationId, dto.getId());
        boolean exists = deviceInfoMapper.exists(deviceInfoLambdaQueryWrapper);
        if (exists) {
            throw new CustomizeException("有挂载设备不允许删除，不允许删除");
        }

        // 删除区域
        this.removeById(dto.getId());
    }
}