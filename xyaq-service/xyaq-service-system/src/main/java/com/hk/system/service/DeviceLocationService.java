package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationAddDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationTreeDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.pojo.DeviceLocation;
import com.hk.system.bean.pojo.Org;
import com.hk.system.bean.vo.device.location.DeviceLocationEditDTO;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeVO;
import com.hk.system.bean.vo.device.location.DeviceLocationVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.system.dao.DeviceLocationMapper;
import com.hk.web.exception.CustomizeException;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.*;
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

    @Resource
    private OrgService orgService;

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
                .filter(k -> StringUtils.isBlank(k.getParentId()))
                .map(this::toDeviceLocationTreeVO)
                .toList();
        Map<String, List<DeviceLocationTreeVO>> leafMap = list.stream()
                .filter(k -> StringUtils.isNotBlank(k.getParentId()))
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
        if (StringUtils.isNotBlank(deviceLocation.getLabel())) {
            vo.setLabelList(Arrays.asList(deviceLocation.getLabel().split(",")));
        } else {
            vo.setLabelList(new ArrayList<>());
        }
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

    public void add(DeviceLocationAddDTO dto) {

        // 验证组织存在
        boolean exists = orgService.lambdaQuery().eq(Org::getId, dto.getOrgId()).exists();
        if (!exists) {
            throw new CustomizeException("该组织不存在");
        }

        if (StringUtils.isNotBlank(dto.getParentId())) {
            // 验证上级区域
            exists = lambdaQuery().eq(DeviceLocation::getId, dto.getParentId()).exists();
            if (!exists) {
                throw new CustomizeException("上级区域不存在");
            }
        }

        this.save(toDeviceLocation(dto));
    }

    private DeviceLocation toDeviceLocation(DeviceLocationAddDTO dto) {

        DeviceLocation vo = new DeviceLocation();
        BeanUtil.copyProperties(dto, vo);
        vo.setLabel(String.join(",", dto.getLabelList()));
        return vo;
    }

    public void edit(DeviceLocationEditDTO dto) {

        DeviceLocation deviceLocation = this.baseMapper.selectById(dto.getId());
        if (Objects.isNull(deviceLocation)) {
            throw new CustomizeException("数据不存在");
        }
        // TODO 编辑
    }
}