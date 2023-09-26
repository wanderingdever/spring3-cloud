package com.hk.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hk.datasource.bean.dto.IdListDTO;
import com.hk.system.bean.dto.role.RoleDTO;
import com.hk.system.bean.dto.role.RoleEditDTO;
import com.hk.system.bean.dto.role.RoleSearchDTO;
import com.hk.system.bean.vo.role.RoleVO;
import com.hk.system.service.RoleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/role")
@Tag(name = "角色", description = "角色相关接口")
public class RoleController {

    @Resource
    private RoleService roleService;

    @PostMapping(value = "/add")
    @Operation(summary = "新增角色")
    public void add(RoleDTO dto) {

        roleService.addRole(dto);
    }

    @PostMapping(value = "/edit")
    @Operation(summary = "编辑角色")
    public void edit(RoleEditDTO dto) {

        roleService.updateRole(dto);
    }

    @PostMapping(value = "/del")
    @Operation(summary = "删除角色")
    public void del(IdListDTO dto) {

        roleService.delRole(dto);
    }

    @PostMapping("/page")
    @Operation(summary = "角色分页查询")
    public Page<RoleVO> page(@RequestBody RoleSearchDTO dto) {
        return roleService.page(dto);
    }
}