package com.hk.system.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.hk.satoken.service.DataScopeService;
import com.hk.system.bean.pojo.DeviceInfo;
import com.hk.system.dao.DeviceInfoMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 测试接口
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/test")
@Tag(name = "测试接口")
public class TestController {

    @PostMapping(value = "/saTokenTest")
    @Operation(description = "测试sa-token")
    public String test() {
        StpUtil.getRoleList();
        return StpUtil.getLoginId().toString();
    }


    @Resource
    private DeviceInfoMapper deviceInfoMapper;

    @PostMapping("/authorized_org_id_list_and_child2")
    @Operation(summary = "查询用户授权的部门id列表（包含）22")
    public List<DeviceInfo> authorizedOrgIdListAndChild2() {
        List<DeviceInfo> deviceInfoList = deviceInfoMapper.allList();
        return deviceInfoList;
    }

    @Resource
    private DataScopeService dataScopeService;

    @PostMapping("/authorized_org_id_list")
    @Operation(summary = "查询用户授权的部门id列表")
    public List<String> authorizedOrgIdList() {
        return dataScopeService.authorizedOrgIdListOneSelf();
    }

    @PostMapping("/authorized_org_id_list_and_child")
    @Operation(summary = "查询用户授权的部门id列表（包含）")
    public List<String> authorizedOrgIdListAndChild() {
        return dataScopeService.authorizedOrgIdList();
    }
}