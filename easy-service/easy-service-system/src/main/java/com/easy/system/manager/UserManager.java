package com.easy.system.manager;


import com.easy.core.enums.DelEnum;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.system.bean.dto.user.UserDTO;
import com.easy.system.bean.dto.user.UserEditDTO;
import com.easy.system.bean.dto.user.UserPwdDTO;
import com.easy.system.bean.pojo.User;
import com.easy.system.bean.pojo.UserOrg;
import com.easy.system.bean.pojo.UserPost;
import com.easy.system.bean.pojo.UserRole;
import com.easy.system.service.*;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.dromara.hutool.crypto.digest.BCrypt;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

/**
 * </p>
 *
 * @author Matt
 */
@Component
public class UserManager {

    @Resource
    private UserService userService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private UserPostService userPostService;

    @Resource
    private UserRoleService userRoleService;

    @Resource
    private UserOrgService userOrgService;

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public String add(UserDTO dto) {
        User user = userService.add(dto);
        userInfoService.add(dto, user.getId());
        addInfo(dto, user.getId());
        return user.getPassword();
    }

    private void addInfo(UserDTO dto, String userId) {
        // 组织关联新增
        List<UserOrg> userOrgs = userOrgService.getList(List.of(userId), Collections.singletonList(dto.getOrgId()));
        userOrgService.saveBatch(userOrgs);
        // 岗位关联新增
        if (CollectionUtils.isNotEmpty(dto.getPostList())) {
            List<UserPost> userPosts = userPostService.getList(List.of(userId), dto.getPostList());
            userPostService.saveBatch(userPosts);
        }
        // 角色关联新增
        if (CollectionUtils.isNotEmpty(dto.getRoleList())) {
            List<UserRole> userRoles = userRoleService.getList(List.of(userId), dto.getRoleList());
            userRoleService.saveBatch(userRoles);
        }

    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void update(UserEditDTO dto) {

        userService.update(dto);
        userInfoService.update(dto);
        // 删除岗位、角色、组织关联编辑
        delInfo(dto.getId());
        // 新增岗位、角色、组织关联编辑
        addInfo(dto, dto.getId());
    }

    private void delInfo(String userId) {

        userOrgService.lambdaUpdate().eq(UserOrg::getUserId, userId).set(UserOrg::getDel, DelEnum.DELETE.getCode()).update();
        userRoleService.lambdaUpdate().eq(UserRole::getUserId, userId).set(UserRole::getDel, DelEnum.DELETE.getCode()).update();
        userPostService.lambdaUpdate().eq(UserPost::getUserId, userId).set(UserPost::getDel, DelEnum.DELETE.getCode()).update();
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdDTO dto) {
        // 删除账号
        userService.del(dto);
        userInfoService.del(dto.getId());
        // 岗位、角色、组织关联删除
        delInfo(dto.getId());
    }

    /**
     * 重置密码
     *
     * @param dto 入参
     */
    public void resetPwd(UserPwdDTO dto) {
        User user = userService.lambdaQuery().eq(User::getUsername, dto.getUsername()).one();
        user.setPassword(BCrypt.hashpw(dto.getPassword()));
        userService.updateById(user);
    }
}