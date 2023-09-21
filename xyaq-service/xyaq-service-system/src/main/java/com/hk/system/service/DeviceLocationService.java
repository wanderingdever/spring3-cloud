package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.bean.dto.IdDTO;
import com.hk.framework.exception.CustomizeException;
import com.hk.system.bean.dto.device.location.DeviceLocationAddDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationEditDTO;
import com.hk.system.bean.dto.device.location.DeviceLocationTreeDTO;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.bean.pojo.DeviceLocation;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeVO;
import com.hk.system.bean.vo.device.location.DeviceLocationVO;
import com.hk.system.dao.DeviceInfoMapper;
import com.hk.system.dao.DeviceLocationMapper;
import com.hk.system.manager.Condition;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        Condition.of(deviceLocation.getLabel(), StringUtils::isNotBlank).handle(k -> vo.setLabelList(Arrays.asList(deviceLocation.getLabel().split(","))));
        return vo;
    }

    public DeviceLocationVO info(IdDTO dto) {

        DeviceLocation deviceLocation = getLocation(dto.getId());
        return toDeviceLocationVO(deviceLocation);
    }

    private DeviceLocationVO toDeviceLocationVO(DeviceLocation deviceLocation) {
        DeviceLocationVO vo = new DeviceLocationVO();
        BeanUtil.copyProperties(deviceLocation, vo);
        return vo;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdDTO dto) {

        LambdaQueryWrapper<DeviceLocation> selectLambdaQueryWrapper = new LambdaQueryWrapper<>();
        selectLambdaQueryWrapper.eq(DeviceLocation::getParentId, dto.getId());
        List<DeviceLocation> list = list(selectLambdaQueryWrapper);
        if (CollectionUtils.isNotEmpty(list)) {
            throw new CustomizeException("存在下级区域，不允许删除");
        }

        LambdaQueryWrapper<DeviceInfo> deviceInfoLambdaQueryWrapper = new LambdaQueryWrapper<>();
        deviceInfoLambdaQueryWrapper.eq(DeviceInfo::getDeviceLocationId, dto.getId());
        if (deviceInfoMapper.exists(deviceInfoLambdaQueryWrapper)) {
            throw new CustomizeException("有挂载设备不允许删除，不允许删除");
        }

        // 删除区域
        this.removeById(dto.getId());
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void add(DeviceLocationAddDTO dto) {

        orgService.getOrg(dto.getOrgId());
        Condition.of(dto.getParentId(), StringUtils::isNotBlank).handle(k -> getLocation(dto.getParentId()));
        this.save(toDeviceLocation(dto));
    }

    private DeviceLocation toDeviceLocation(DeviceLocationAddDTO dto) {

        DeviceLocation vo = new DeviceLocation();
        BeanUtil.copyProperties(dto, vo);
        Condition.of(dto.getLabelList(), CollectionUtils::isNotEmpty).handle(k -> vo.setLabel(String.join(",", dto.getLabelList())));
        return vo;
    }

    public DeviceLocation getLocation(String id) {
        return getLocation(List.of(id)).get(0);
    }

    public List<DeviceLocation> getLocation(Collection<String> idColl) {

        HashSet<String> idSet = idColl instanceof HashSet ? (HashSet<String>) idColl : new HashSet<>(idColl);
        List<DeviceLocation> list = lambdaQuery().in(DeviceLocation::getId, idSet).list();
        if (list.size() != idSet.size()) {
            throw new CustomizeException("区域不存在");
        }
        return list;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void edit(DeviceLocationEditDTO dto) {

        getLocation(dto.getId());
        // 编辑
        lambdaUpdate()
                .eq(DeviceLocation::getId, dto.getId())
                .set(StringUtils.isNotBlank(dto.getOrgId()), DeviceLocation::getOrgId, dto.getOrgId())
                .set(StringUtils.isNotBlank(dto.getParentId()), DeviceLocation::getParentId, dto.getParentId())
                .set(StringUtils.isNotBlank(dto.getName()), DeviceLocation::getName, dto.getName())
                .set(StringUtils.isNotBlank(dto.getShortName()), DeviceLocation::getShortName, dto.getShortName())
                .set(CollectionUtils.isNotEmpty(dto.getLabelList()), DeviceLocation::getLabel, dto.getLabel())
                .set(StringUtils.isNotBlank(dto.getLongitude()), DeviceLocation::getLongitude, dto.getLongitude())
                .set(StringUtils.isNotBlank(dto.getLatitude()), DeviceLocation::getLatitude, dto.getLatitude())
                .set(StringUtils.isNotBlank(dto.getRemark()), DeviceLocation::getRemark, dto.getRemark())
                .set(Objects.nonNull(dto.getSort()), DeviceLocation::getSort, dto.getSort())
                .update();
    }
}