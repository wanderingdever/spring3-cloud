package com.hk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hk.system.bean.dto.user.UserSearchDTO;
import com.hk.system.bean.pojo.User;
import com.hk.system.bean.vo.user.UserInfoExpandVO;
import com.hk.system.bean.vo.user.UserInfoVO;
import com.hk.system.dao.provider.UserProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

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
    Page<UserInfoExpandVO> userInfoPage(Page<UserInfoVO> page, @Param("dto") UserSearchDTO dto);
}