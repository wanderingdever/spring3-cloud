package com.hk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hk.system.bean.pojo.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}