package com.hk.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.api.service.RemoteRoleService;
import com.hk.api.vo.UserRoleAndPermissionVO;
import com.hk.datasource.bean.dto.IdListDTO;
import com.hk.datasource.utils.PageUtil;
import com.hk.framework.enums.DelEnum;
import com.hk.framework.exception.CustomizeException;
import com.hk.system.bean.dto.role.RoleDTO;
import com.hk.system.bean.dto.role.RoleEditDTO;
import com.hk.system.bean.dto.role.RoleSearchDTO;
import com.hk.system.bean.pojo.Role;
import com.hk.system.bean.pojo.RoleMenu;
import com.hk.system.bean.pojo.UserRole;
import com.hk.system.bean.vo.role.RoleVO;
import com.hk.system.dao.RoleMapper;
import com.hk.utils.lang.StringUtil;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
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

    public Page<RoleVO> page(RoleSearchDTO dto) {
        Page<Role> page = lambdaQuery()
                .like(StringUtil.isNotBlank(dto.getRoleName()), Role::getRoleName, dto.getRoleName())
                .eq(StringUtil.isNotBlank(dto.getRoleKey()), Role::getRoleKey, dto.getRoleKey())
                .eq(StringUtil.isNotNull(dto.getAuthorityLevel()), Role::getAuthorityLevel, dto.getAuthorityLevel())
                .eq(StringUtil.isNotNull(dto.getEnable()), Role::getEnable, dto.getEnable())
                .eq(StringUtil.isNotBlank(dto.getOrgId()), Role::getOrgId, dto.getOrgId())
                .page(PageUtil.getPage(dto));
        return PageUtil.getPage(page, RoleVO.class);
    }

    @Transactional(rollbackFor = Exception.class)
    public void addRole(RoleDTO dto) {
        Role role = new Role();
        BeanUtil.copyProperties(dto, role);
        // 保存角色信息
        this.save(role);
        // 保存角色菜单关联信息
        saveRoleMenu(role.getId(), dto.getMenuIds());
    }

    /**
     * 构建并保存角色菜单关联信息
     *
     * @param roleId  角色id
     * @param menuIdS 菜单ID数组
     */
    public void saveRoleMenu(String roleId, List<String> menuIdS) {
        List<RoleMenu> roleMenuList = getRoleMenuList(roleId, menuIdS);
        roleMenuService.saveBatch(roleMenuList);
    }

    /**
     * 构建角色菜单关联实体集合
     *
     * @param roleId  角色ID
     * @param menuIdS 菜单ID数组
     * @return List<RoleMenu>
     */
    public List<RoleMenu> getRoleMenuList(String roleId, List<String> menuIdS) {
        if (CollectionUtils.isEmpty(menuIdS)) {
            return null;
        }
        List<RoleMenu> roleMenuList = new ArrayList<>();
        for (String menuId : menuIdS) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            roleMenuList.add(roleMenu);
        }
        return roleMenuList;
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateRole(RoleEditDTO dto) {

        // 更新角色信息
        Role role = new Role();
        BeanUtil.copyProperties(dto, role);
        this.updateById(role);
        // 删除原有菜单
        roleMenuService.remove(new QueryWrapper<RoleMenu>().lambda().eq(RoleMenu::getRoleId, dto.getId()));
        // 保存角色菜单关联信息
        saveRoleMenu(dto.getId(), dto.getMenuIds());
    }

    @Transactional(rollbackFor = Exception.class)
    public void delRole(IdListDTO dto) {

        for (String id : dto.getIdList()) {
            int userRole = this.baseMapper.countUserByRoleId(id);
            if (userRole > 0) {
                throw new CustomizeException("所选角色已被分配,无法删除");
            } else {
                // 删除角色
                this.removeById(id);
                // 删除角色菜单关联
                roleMenuService.lambdaUpdate()
                        .eq(RoleMenu::getRoleId, id)
                        .set(RoleMenu::getDel, DelEnum.DELETE.getCode())
                        .update();
            }
        }
    }
}