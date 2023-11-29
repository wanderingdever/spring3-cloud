package com.easy.system.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.easy.datasource.scope.DataScopeService;
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

    @Resource
    private DataScopeService dataScopeService;

    @PostMapping(value = "/saTokenTest")
    @Operation(description = "测试sa-token")
    public String test() {
        StpUtil.getRoleList();
        return StpUtil.getLoginId().toString();
    }

    @PostMapping("/authorized_org_id_list")
    @Operation(description = "查询用户授权的部门id列表")
    public List<String> authorizedOrgIdList() {
        return dataScopeService.authorizedOrgIdListOneSelf();
    }

    @PostMapping("/authorized_org_id_list_and_child")
    @Operation(description = "查询用户授权的部门id列表（包含）")
    public List<String> authorizedOrgIdListAndChild() {
        return dataScopeService.authorizedOrgIdList();
    }
}