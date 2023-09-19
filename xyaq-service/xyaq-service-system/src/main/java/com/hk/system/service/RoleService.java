package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.api.service.RemoteRoleService;
import com.hk.api.vo.UserRoleAndPermissionVO;
import com.hk.datasource.utils.PageUtil;
import com.hk.system.bean.dto.RoleDTO;
import com.hk.system.bean.dto.RoleSearchDTO;
import com.hk.system.bean.pojo.Role;
import com.hk.system.bean.pojo.UserRole;
import com.hk.system.dao.RoleMapper;
import com.hk.utils.lang.StringUtil;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
@AllArgsConstructor
@DubboService(interfaceClass = RemoteRoleService.class)
public class RoleService extends ServiceImpl<RoleMapper, Role> implements RemoteRoleService {
    private final static Logger LOGGER = LoggerFactory.getLogger(RoleService.class);
    private final UserRoleService userRoleService;
    private final RoleMenuService roleMenuService;

    /**
     * 根据用户ID获取用户的角色列表KEY
     *
     * @param userId 用户ID
     * @return {@link  List<String>} 用户的角色key
     */
    @Override
    public UserRoleAndPermissionVO getUserRoleKeyList(String userId) {
        // 查询用户角色关联
        List<UserRole> userRoleList = userRoleService.lambdaQuery().eq(UserRole::getUserId, userId).list();
        if (userRoleList.isEmpty()) {
            LOGGER.error("DUBBO调用->未查询到用户角色关联");
            return null;
        }
        // 查询role id
        List<String> roleIdList = userRoleList.stream().map(UserRole::getRoleId).toList();
        // 查询权限集合
        List<String> permissions = roleMenuService.getBaseMapper().selectRolePermissions(roleIdList);
        // 查询角色key集合
        List<String> roles = lambdaQuery().in(Role::getId, roleIdList).list().stream().map(Role::getRoleKey).toList();
        return new UserRoleAndPermissionVO(roles, permissions);
    }

    public Page<Role> pageRole(RoleSearchDTO dto) {
        return lambdaQuery().eq(StringUtil.isNotBlank(dto.getRoleName()), Role::getRoleName, dto.getRoleName())
                .eq(StringUtil.isNotBlank(dto.getRoleKey()), Role::getRoleKey, dto.getRoleKey())
                .eq(StringUtil.isNotNull(dto.getAuthorityLevel()), Role::getAuthorityLevel, dto.getAuthorityLevel())
                .eq(StringUtil.isNotNull(dto.getEnable()), Role::getEnable, dto.getEnable())
                .eq(StringUtil.isNotBlank(dto.getOrgId()), Role::getOrgId, dto.getOrgId())
                .page(PageUtil.getPage(dto));
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