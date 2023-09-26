package com.hk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hk.system.bean.pojo.Role;
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

    @Select("SELECT * FROM xyaq_role WHERE id IN (SELECT role_id FROM xyaq_user_role WHERE user_id = #{userId} AND del = 0)")
    List<Role> getAuthRoleList(@Param("userId") String userId);

    /**
     * 统计角色下面的账户
     *
     * @param roleId 角色id
     * @return 统计结果
     */
    @Select("SELECT COUNT(*)  FROM xyaq_role WHERE role_id = #{roleId}")
    int countUserByRoleId(@Param("roleId") String roleId);
}