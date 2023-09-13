package com.hk.system.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.framework.bean.vo.UserVO;
import com.hk.system.bean.pojo.User;
import com.hk.system.dao.UserMapper;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.stereotype.Service;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class UserService extends ServiceImpl<UserMapper, User> {

    /**
     * 根据账号信息获取用户信息
     *
     * @param username 账号/手机号/邮箱
     * @return {@link com.hk.framework.bean.vo.UserVO}
     */
    public UserVO selectUserByUsername(String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        // 通过账号/邮箱/手机号查询用户
        queryWrapper.lambda().eq(User::getUsername, username).or().eq(User::getEmail, username).or().eq(User::getPhone, username);
        User user = baseMapper.selectOne(queryWrapper);
        if (user == null) {
            return null;
        }
        UserVO target = new UserVO();
        BeanCopier beanCopier = BeanCopier.create(User.class, UserVO.class, false);
        beanCopier.copy(user, target, null);
        return target;
    }
}