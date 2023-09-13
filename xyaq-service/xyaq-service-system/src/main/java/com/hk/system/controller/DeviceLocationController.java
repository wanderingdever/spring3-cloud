package com.hk.system.controller;

import com.hk.system.bean.vo.IdVO;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeSearchVO;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeVO;
import com.hk.system.bean.vo.device.location.DeviceLocationVO;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeSearchVO;
import com.hk.system.bean.vo.device.location.DeviceLocationTreeVO;
import com.hk.system.service.DeviceLocationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>设备位置</p>
 *
 * @author 小徐
 * @since 2023/9/12 13:38
 */
@Tag(name = "设备位置")
@Slf4j
@RestController
@RequestMapping("/device-location")
public class DeviceLocationController {

    @Resource
    private DeviceLocationService deviceLocationService;

    @PostMapping("/tree")
    @Operation(summary = "区域树查询", description = "使用 orgId 查询机构下的树")
    public List<DeviceLocationTreeVO> tree(@RequestBody @Valid DeviceLocationTreeSearchVO vo) {
        return deviceLocationService.tree(vo);
    }

    @PostMapping("/info")
    @Operation(summary = "区域查询", description = "使用 Id 查询详情")
    public DeviceLocationVO tree(@RequestBody @Valid IdVO vo) {
        return deviceLocationService.info(vo);
    }
}