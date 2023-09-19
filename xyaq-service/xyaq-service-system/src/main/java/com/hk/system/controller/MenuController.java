package com.hk.system.controller;


import cn.dev33.satoken.annotation.SaCheckPermission;
import com.hk.system.bean.dto.MenuDTO;
import com.hk.system.bean.dto.MenuListDTO;
import com.hk.system.bean.pojo.Menu;
import com.hk.system.bean.vo.MenuTreeVO;
import com.hk.system.bean.vo.router.RouterVO;
import com.hk.system.service.MenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * 菜单管理
 *
 * @author Matt
 */
@RestController
@RequestMapping("/menu")
@Tag(name = "菜单管理")
public class MenuController {
    private final MenuService menuService;

    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }

    /**
     * 获取用户路由
     *
     * @return Menu
     */
    @PostMapping(value = "/user_router")
    @Operation(description = "获取用户路由")
    public List<RouterVO> getUserRouter() {
        return menuService.getUserRouter();
    }

    /**
     * 获取树形菜单
     *
     * @param dto 查询条件
     * @return MenuTree
     */
    @PostMapping(value = "/tree")
    @Operation(description = "树形菜单")
    @SaCheckPermission("system.menu.tree")
    public List<MenuTreeVO> getTreeMenu(@RequestBody MenuListDTO dto) {
        return menuService.getTreeMenu(dto);
    }

    /**
     * 新增菜单
     *
     * @param dto 菜单信息
     */
    @PostMapping(value = "/add")
    @Operation(description = "新增菜单")
    @SaCheckPermission("system.menu.add")
    public String addMenu(@Valid @RequestBody MenuDTO dto) {
        menuService.addMenu(dto);
        return "新增成功";
    }

    /**
     * 修改菜单
     *
     * @param menu 菜单信息
     */
    @PostMapping(value = "/update")
    @Operation(description = "修改菜单")
    @SaCheckPermission("system.menu.update")
    public String updateMenu(@Valid @RequestBody Menu menu) {
        menuService.updateMenu(menu);
        return "修改成功";
    }

    /**
     * 删除菜单
     *
     * @param ids 菜单id
     */
    @PostMapping(value = "/del")
    @Operation(description = "删除菜单")
    @SaCheckPermission("system.menu.del")
    public String delMenu(@RequestBody List<String> ids) {
        menuService.delMenu(ids);
        return "删除成功";
    }
}