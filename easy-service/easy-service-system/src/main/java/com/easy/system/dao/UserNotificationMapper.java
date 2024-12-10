package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.pojo.UserNotice;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface UserNotificationMapper extends BaseMapper<UserNotice> {

    @Delete("delete from sys_user_notice where notice_id = #{id}")
    void deleteByNoticeId(@Param("id") String id);
}