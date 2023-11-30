package com.easy.system.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.api.service.RemoteUserService;
import com.easy.api.vo.UserVO;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.datasource.scope.DataScopeService;
import com.easy.framework.exception.CustomizeException;
import com.easy.system.bean.dto.user.UserAddDTO;
import com.easy.system.bean.dto.user.UserEditDTO;
import com.easy.system.bean.dto.user.UserSearchDTO;
import com.easy.system.bean.enums.AuthorityLevel;
import com.easy.system.bean.pojo.Org;
import com.easy.system.bean.pojo.Role;
import com.easy.system.bean.pojo.User;
import com.easy.system.bean.vo.user.UserInfoExpandVO;
import com.easy.system.dao.OrgMapper;
import com.easy.system.dao.RoleMapper;
import com.easy.system.dao.UserMapper;
import jakarta.annotation.Resource;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.BeanUtils;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
@DubboService(interfaceClass = RemoteUserService.class)
public class UserService extends ServiceImpl<UserMapper, User> implements RemoteUserService {

    @Resource
    private OrgMapper orgMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private DataScopeService dataScopeService;

    /**
     * 根据账号信息获取用户信息
     *
     * @param username 账号/手机号/邮箱
     * @return {@link UserVO}
     */
    @Override
    public UserVO selectUserByUsername(String username) {
        // 查询用户信息
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        // 通过账号/邮箱/手机号查询用户
        queryWrapper.eq(User::getUsername, username).or().eq(User::getEmail, username).or().eq(User::getPhone, username);
        User user = baseMapper.selectOne(queryWrapper);
        if (user == null) {
            return null;
        }
        return toUserVO(user);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public String add(UserAddDTO dto) {

        User user = new User();
        BeanUtils.copyProperties(dto, user);
        user.setPassword(BCrypt.hashpw(dto.getPassword()));

        try {
            this.baseMapper.insert(user);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                throw new CustomizeException("账号已存在");
            } else {
                throw new CustomizeException("操作失败");
            }
        }
        return user.getId();
    }

    private UserVO toUserVO(User user) {
        if (user == null) {
            return null;
        }
        UserVO userVO = new UserVO();
        userVO.setUsername(user.getUsername());
        userVO.setPassword(user.getPassword());
        userVO.setEmail(user.getEmail());
        userVO.setPhone(user.getPhone());
        userVO.setClient(user.getClient());
        userVO.setSort(user.getSort());
        userVO.setStatus(user.getStatus());
        userVO.setId(user.getId());
        userVO.setCreateBy(user.getCreateBy());
        userVO.setCreateTime(user.getCreateTime());
        userVO.setUpdateBy(user.getUpdateBy());
        userVO.setUpdateTime(user.getUpdateTime());
        userVO.setDel(user.getDel());
        return userVO;
    }

    @Override
    public List<String> authorizedOrgIdListOneSelf() {

        return getAuthorizedOrgIdList(false);
    }

    @Override
    public List<String> authorizedOrgIdList() {
        return getAuthorizedOrgIdList(true);
    }

    private List<String> getAuthorizedOrgIdList(boolean containsChild) {

        String userId = (String) StpUtil.getLoginId();
        List<Role> authRoleList = roleMapper.getAuthRoleList(userId);
        if (CollectionUtils.isEmpty(authRoleList)) {
            return new ArrayList<>();
        }
        Set<String> orgIdSet = authRoleList.stream().map(Role::getOrgId).collect(Collectors.toSet());

        // 需要返回子部门
        if (containsChild) {
            Map<String, AuthorityLevel> authOrgChildMap = authRoleList.stream()
                    .collect(Collectors.toMap(Role::getOrgId, Role::getAuthorityLevel, (c1, c2) -> c1.getPriorityLevel() > c2.getPriorityLevel() ? c1 : c2));
            List<Org> allOrgList = orgMapper.selectList(new QueryWrapper<>());
            LinkedList<Org> tempOrgList = new LinkedList<>();
            Map<String, List<Org>> orgListMap = allOrgList.stream().peek(k -> {
                if (orgIdSet.contains(k.getId())) {
                    tempOrgList.add(k);
                }
            }).collect(Collectors.groupingBy(Org::getOrgParentId));

            while (!tempOrgList.isEmpty()) {
                Org org = tempOrgList.poll();
                String orgId = org.getId();
                orgIdSet.add(orgId);
                if (authOrgChildMap.containsKey(orgId) && authOrgChildMap.get(orgId) == AuthorityLevel.ONESELF) {
                    continue;
                }
                for (Org org_ : orgListMap.getOrDefault(orgId, new ArrayList<>())) {
                    tempOrgList.push(org_);
                }
            }
        }
        return new LinkedList<>(orgIdSet);
    }

    public UserInfoExpandVO getUserInfo() {
        return this.baseMapper.selectUserInfo((String) StpUtil.getLoginId());
    }

    public Page<UserInfoExpandVO> page(UserSearchDTO dto) {

        Page<UserInfoExpandVO> page = new Page<>(dto.getCurrent(), dto.getSize());
        List<UserInfoExpandVO> userList = baseMapper.userInfoPage(dto);
        page.setRecords(userList);
        List<String> userIdList = userList.stream().map(UserInfoExpandVO::getId).toList();
        // TODO 岗位、角色、组织关联查询
        return page;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void update(UserEditDTO dto) {

        User user = this.getById(dto.getId());
        BeanUtils.copyProperties(dto, user);
        user.setPassword(BCrypt.hashpw(dto.getPassword()));
        // 更新账号
        this.updateById(user);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdDTO dto) {
        // 删除账号
        this.baseMapper.deleteById(dto.getId());
    }
}