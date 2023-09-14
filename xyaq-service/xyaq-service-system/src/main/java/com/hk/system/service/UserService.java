package com.hk.system.service;

import cn.dev33.satoken.secure.BCrypt;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.api.service.RemoteUserService;
import com.hk.api.vo.UserVO;
import com.hk.system.bean.dto.UserAddDTO;
import com.hk.system.bean.pojo.User;
import com.hk.system.dao.UserMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
@DubboService(interfaceClass = RemoteUserService.class)
public class UserService extends ServiceImpl<UserMapper, User> implements RemoteUserService {


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

    public String addUser(UserAddDTO add) {
        User user = new User();
        user.setUsername(add.getUsername());
        user.setPassword(BCrypt.hashpw(add.getPassword()));
        user.setClient("PC");
        user.setSort(1);
        user.setStatus("NORMAL");
        this.baseMapper.insert(user);
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
}