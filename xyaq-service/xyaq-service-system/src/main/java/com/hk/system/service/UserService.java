package com.hk.system.service;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.api.service.RemoteUserService;
import com.hk.api.vo.UserVO;
import com.hk.datasource.utils.PageUtil;
import com.hk.framework.enums.AccountClient;
import com.hk.framework.enums.AccountStatus;
import com.hk.framework.exception.CustomizeException;
import com.hk.system.bean.dto.user.UserAddDTO;
import com.hk.system.bean.dto.user.UserSearchDTO;
import com.hk.system.bean.enums.AuthorityLevel;
import com.hk.system.bean.pojo.Org;
import com.hk.system.bean.pojo.Role;
import com.hk.system.bean.pojo.User;
import com.hk.system.bean.pojo.UserInfo;
import com.hk.system.bean.vo.user.UserInfoVO;
import com.hk.system.dao.OrgMapper;
import com.hk.system.dao.RoleMapper;
import com.hk.system.dao.UserMapper;
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

    @Transactional(rollbackFor = Exception.class)
    public String addUser(UserAddDTO add) {
        User user = new User();
        user.setUsername(add.getUsername());
        user.setPassword(BCrypt.hashpw(add.getPassword()));
        user.setClient(AccountClient.WEB);
        user.setSort(1);
        user.setStatus(AccountStatus.NORMAL);
        try {
            this.baseMapper.insert(user);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                throw new CustomizeException("账号已存在");
            } else {
                throw new CustomizeException("操作失败");
            }
        }
        return "操作成功";
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

    public UserInfoVO getUserInfo() {
        return this.baseMapper.selectUserInfo((String) StpUtil.getLoginId());
    }

    public Page<UserInfoVO> page(UserSearchDTO dto) {

        return baseMapper.userInfoPage(PageUtil.getPage(dto), dto);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void updateUser(UserInfoVO userVo) {

        // TODO 编辑
        User user = new User();
        BeanUtils.copyProperties(userVo, user);
        // 更新账号
        this.updateById(user);
        // 用户信息
        UserInfo userInfo = new UserInfo();
        BeanUtils.copyProperties(userVo, userInfo);
        userInfo.setUserId(userVo.getId());
        // 更新用户信息
//        userInfoMapper.updateByUserId(userInfo);
        // 更新用户机构信息
//        this.baseMapper.updateUserOrg(user.getId(), userVo.getOrgId());
        // 处理用户角色信息
        if (userVo.getRoles().size() > 0) {
            // 删除原有用户角色信息
//            this.baseMapper.delBatchUserRole(Collections.singletonList(user.getId()));
            // 新增用户角色信息
//            List<UserRole> userRoleList = userVo.getRoles().stream().map(role -> new UserRole(user.getId(), role)).collect(Collectors.toList());
            // 用户角色信息
//            userRoleService.saveBatch(userRoleList);
        }
        // 处理用户岗位信息 删除原有用户岗位信息 在保存
//        if (StringUtils.isNotBlank(userVo.getPost())) {
//            userPostService.getBaseMapper().delBatchUserPost(Collections.singletonList(user.getId()));
//            userPostService.save(new UserPost(user.getId(), userVo.getPost()));
//        }
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void delUser(List<String> ids) {
        // TODO 删除
        // 删除用户机构信息
//        this.baseMapper.delBatchUserOrg(ids);
        // 删除用户角色信息
//        this.baseMapper.delBatchUserRole(ids);
        // 删除用户信息
//        userInfoMapper.delBatchByUserId(ids);
        // 删除账号
        this.baseMapper.deleteBatchIds(ids);
    }
}