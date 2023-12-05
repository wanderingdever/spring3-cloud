package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.pojo.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {

    @Select("SELECT * FROM sys_role WHERE id IN (SELECT role_id FROM sys_user_role WHERE user_id = #{userId} AND del = 0)")
    List<Role> getAuthRoleList(@Param("userId") String userId);
}