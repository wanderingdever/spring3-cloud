package com.easy.system.service;

import cn.hutool.crypto.digest.BCrypt;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.api.service.RemoteUserService;
import com.easy.api.vo.LoginLogsVO;
import com.easy.api.vo.RoleVO;
import com.easy.api.vo.UserRoleAndPermissionVO;
import com.easy.api.vo.UserVO;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.datasource.scope.DataScopeService;
import com.easy.framework.enums.AuthorityLevel;
import com.easy.framework.exception.CustomizeException;
import com.easy.satoken.utils.LoginUtil;
import com.easy.system.bean.dto.user.UserDTO;
import com.easy.system.bean.dto.user.UserEditDTO;
import com.easy.system.bean.dto.user.UserSearchDTO;
import com.easy.system.bean.pojo.Org;
import com.easy.system.bean.pojo.Role;
import com.easy.system.bean.pojo.User;
import com.easy.system.bean.pojo.UserRole;
import com.easy.system.bean.vo.user.UserInfoExpandVO;
import com.easy.system.dao.OrgMapper;
import com.easy.system.dao.RoleMapper;
import com.easy.system.dao.UserMapper;
import com.easy.utils.http.IpLocation;
import com.easy.utils.http.IpUtil;
import com.easy.utils.lang.DateUtil;
import com.easy.utils.lang.IdUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
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
@AllArgsConstructor
public class UserService extends ServiceImpl<UserMapper, User> implements RemoteUserService {

    private final OrgMapper orgMapper;

    private final RoleMapper roleMapper;

    private final DataScopeService dataScopeService;

    private final UserRoleService userRoleService;
    private final RoleService roleService;

    private LoginLogsService loginLogsService;

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
    public User add(UserDTO dto) {

        User user = new User();
        BeanUtils.copyProperties(dto, user);
        // FIXME 随机密码
        String password = IdUtil.generateRandomCode8();
        user.setPassword(BCrypt.hashpw(password));

        try {
            this.baseMapper.insert(user);
            user.setPassword(password);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                throw new CustomizeException("账号已存在");
            } else {
                throw new CustomizeException("操作失败");
            }
        }
        return user;
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

        String userId = LoginUtil.getLoginId();
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

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public UserInfoExpandVO getUserInfo(HttpServletRequest request) {
        UserInfoExpandVO userInfo = this.baseMapper.selectUserInfo(LoginUtil.getLoginId());
        //  岗位、角色、组织关联查询
        UserRoleAndPermissionVO userRoleList = roleService.getUserRoleKeyList(userInfo.getId());
        userInfo.setRoleList(userRoleList.getRoles().stream().map(RoleVO::getRoleKey).toList());
        userInfo.setRoles(userRoleList.getRoles());
        userInfo.setPermissionList(userRoleList.getPermissions());

        // 保存登录记录
        IpLocation location = IpUtil.getLocation(request);
        LoginLogsVO loginLogs = new LoginLogsVO();
        loginLogs.setUserId(userInfo.getId());
        loginLogs.setUserName(userInfo.getUsername());
        loginLogs.setIp(location.getIp());
        loginLogs.setBrowser(request.getHeader("User-Agent"));
        loginLogs.setIpLocation(String.join(",", location.getCountry(), location.getProvince(), location.getCity()));
        loginLogs.setLoginTime(DateUtil.now());
        loginLogsService.saveLoginLogs(loginLogs);

        // 设置登录的IP和属地
        userInfo.setIp(location.getIp());
        userInfo.setIpLocation(location.getCountry() + location.getProvince() + location.getCity());
        userInfo.setLoginTime(DateUtil.now());
        return userInfo;
    }

    public Page<UserInfoExpandVO> page(UserSearchDTO dto) {
        Page<UserInfoExpandVO> page = new Page<>(dto.getCurrent(), dto.getSize());
        List<UserInfoExpandVO> userList = baseMapper.userInfoPage(dto);
        page.setRecords(userList);
        List<String> userIdList = userList.stream().map(UserInfoExpandVO::getId).toList();
        if (CollectionUtils.isNotEmpty(userIdList)) {
            // TODO 岗位、角色、组织关联查询
            List<UserRole> userRoleList = userRoleService.lambdaQuery().in(UserRole::getUserId, userIdList).list();
            if (!userRoleList.isEmpty()) {
                // 转换数据为 userId,List<roleId>
                Map<String, List<String>> collect = userRoleList.stream().collect(Collectors.groupingBy(UserRole::getUserId, Collectors.mapping(UserRole::getRoleId, Collectors.toList())));
                page.getRecords().forEach(k -> k.setRoleList(collect.get(k.getId())));
            }
        }
        return page;
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void update(UserEditDTO dto) {
        // 更新账号
        this.baseMapper.updateUser(dto);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdDTO dto) {
        // 删除账号
        this.baseMapper.deleteById(dto.getId());
    }
}