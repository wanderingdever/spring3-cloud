package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.pojo.RoleMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    /**
     * 根据角色ID查询权限
     *
     * @param roleIdList 角色ID
     * @return 权限字符串集合
     */
    Set<String> selectRolePermissions(@Param("roleIdList") Set<String> roleIdList);
}