package com.hk.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.framework.bean.vo.UserVO;
import com.hk.system.bean.pojo.User;
import com.hk.system.dao.UserMapper;
import org.springframework.stereotype.Service;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class UserService extends ServiceImpl<UserMapper, User> {

    public UserVO selectUserByUsername(String username) {

        return true;
    }
}