package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.pojo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    @Select("SELECT id FROM xyaq_user_info WHERE del = 0 AND user_id = #{userId} LIMIT 1")
    String getIdByUserId(@Param("userId") String userId);
}