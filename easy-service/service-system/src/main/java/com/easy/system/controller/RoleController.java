package com.easy.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.datasource.bean.dto.IdListDTO;
import com.easy.system.bean.dto.role.RoleDTO;
import com.easy.system.bean.dto.role.RoleEditDTO;
import com.easy.system.bean.dto.role.RoleSearchDTO;
import com.easy.system.bean.vo.role.RoleVO;
import com.easy.system.service.RoleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/role")
@Tag(name = "角色", description = "角色相关接口")
public class RoleController {

    @Resource
    private RoleService roleService;

    @PostMapping(value = "/add")
    @Operation(description = "新增角色")
    public void add(@RequestBody @Valid RoleDTO dto) {
        roleService.addRole(dto);
    }

    @PostMapping(value = "/edit")
    @Operation(description = "编辑角色")
    public void edit(@RequestBody @Valid RoleEditDTO dto) {
        roleService.updateRole(dto);
    }

    @PostMapping(value = "/del")
    @Operation(description = "删除角色")
    public void del(@RequestBody IdListDTO dto) {
        roleService.delRole(dto);
    }

    @PostMapping("/page")
    @Operation(description = "角色分页查询")
    public Page<RoleVO> page(@RequestBody RoleSearchDTO dto) {
        return roleService.page(dto);
    }

    @PostMapping(value = "/role_menu_ids")
    @Operation(description = "角色菜单集合")
    public List<String> roleMenuIds(@RequestBody IdDTO dto) {
        return roleService.roleMenuIds(dto);
    }
}