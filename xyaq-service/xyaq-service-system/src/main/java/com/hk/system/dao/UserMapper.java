package com.hk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hk.system.bean.pojo.User;
import com.hk.system.bean.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * 获取用户信息
     *
     * @param userId 用户ID
     * @return UserInfoVO
     */
    UserInfoVO selectUserInfo(@Param("userId") String userId);
}