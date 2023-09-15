package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.system.bean.dto.RoleDTO;
import com.hk.system.bean.dto.RoleSearchDTO;
import com.hk.system.bean.pojo.Role;
import com.hk.system.dao.RoleMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class RoleService extends ServiceImpl<RoleMapper, Role> {

    public Page<Role> pageRole(RoleSearchDTO dto) {
        Page<Role> page = new Page<>();
        page.setCurrent(dto.getCurrent());
        page.setSize(dto.getSize());
        page.setOptimizeCountSql(false);
        // page.setRecords(this.baseMapper.selectPageRole(page, dto));
        return page;
    }

    @Transactional(rollbackFor = Exception.class)
    public void addRole(RoleDTO dto) {
        Role role = new Role();
        BeanUtil.copyProperties(dto, role);
        // 保存角色信息
        this.save(role);
        // 保存角色菜单关联信息
        // saveRoleMenu(role.getId(), dto.getMenuIds());
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateRole(Role role) {
        // 更新角色信息
        this.updateById(role);
        // 删除原有菜单
        // boolean remove = roleMenuService.remove(new QueryWrapper<RoleMenu>().lambda().eq(RoleMenu::getRoleId, role.getId()));
        // 保存角色菜单关联信息
        // saveRoleMenu(role.getId(), role.getMenuIds());
    }

    @Transactional(rollbackFor = Exception.class)
    public void delRole(List<String> ids) {
        for (String id : ids) {
            // int userRole = this.baseMapper.countUserByRoleId(id);
            // if (userRole > 0) {
            //     throw new CustomizeException("所选角色已被分配,无法删除");
            // } else {
            //     // 删除角色
            //     this.removeById(id);
            //     // 删除角色菜单关联
            //     roleMenuService.getBaseMapper().removeByRoleId(id);
            // }
        }
    }
}