package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.dto.user.UserEditDTO;
import com.easy.system.bean.dto.user.UserSearchDTO;
import com.easy.system.bean.pojo.User;
import com.easy.system.bean.vo.user.UserInfoExpandVO;
import com.easy.system.dao.provider.UserProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

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
    UserInfoExpandVO selectUserInfo(@Param("userId") String userId);

    @SelectProvider(type = UserProvider.class, method = "page")
    List<UserInfoExpandVO> userInfoPage(@Param("dto") UserSearchDTO dto);

    /**
     * 更新用户数据
     */
    void updateUser(@Param("dto") UserEditDTO dto);
}