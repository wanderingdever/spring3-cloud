package com.easy.system.manager;

import com.easy.framework.enums.DelEnum;
import com.easy.system.bean.dto.user.UserAddDTO;
import com.easy.system.bean.dto.user.UserEditDTO;
import com.easy.system.bean.pojo.UserOrg;
import com.easy.system.bean.pojo.UserPost;
import com.easy.system.bean.pojo.UserRole;
import com.easy.system.service.*;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public void add(UserAddDTO dto) {

        String userId = userService.add(dto);
        userInfoService.add(dto, userId);
        addInfo(dto, userId);
    }

    private void addInfo(UserAddDTO dto, String userId) {

        // 岗位关联新增
        if (CollectionUtils.isNotEmpty(dto.getPostList())) {
            List<UserPost> userPostList = userPostService.getList(List.of(userId), dto.getPostList());
            userPostService.saveBatch(userPostList);
        }
        // 角色关联新增
        if (CollectionUtils.isNotEmpty(dto.getRoleList())) {
            List<UserRole> userPostList = userRoleService.getList(List.of(userId), dto.getRoleList());
            userRoleService.saveBatch(userPostList);
        }
        // 组织关联新增
        if (CollectionUtils.isNotEmpty(dto.getOrgList())) {
            List<UserOrg> userPostList = userOrgService.getList(List.of(userId), dto.getOrgList());
            userOrgService.saveBatch(userPostList);
        }
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void update(UserEditDTO dto) {

        userService.update(dto);
        userInfoService.update(dto);
        // 删除岗位、角色、组织关联编辑
        delInfo(List.of(dto.getId()));
        // 新增岗位、角色、组织关联编辑
        addInfo(dto, dto.getId());
    }

    private void delInfo(List<String> userIdList) {

        userOrgService.lambdaUpdate().in(UserOrg::getUserId, userIdList).set(UserOrg::getDel, DelEnum.DELETE.getCode()).update();
        userRoleService.lambdaUpdate().in(UserRole::getUserId, userIdList).set(UserRole::getDel, DelEnum.DELETE.getCode()).update();
        userPostService.lambdaUpdate().in(UserPost::getUserId, userIdList).set(UserPost::getDel, DelEnum.DELETE.getCode()).update();
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(List<String> userIdList) {
        // 删除账号
        userService.del(userIdList);
        userInfoService.del(userIdList);
        // 岗位、角色、组织关联删除
        delInfo(userIdList);
    }
}