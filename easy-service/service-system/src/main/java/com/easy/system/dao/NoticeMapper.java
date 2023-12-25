package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.pojo.Notice;
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
public interface NoticeMapper extends BaseMapper<Notice> {

    @Delete("delete from sys_notice where id = #{id}")
    void removeById(@Param("id") String id);
}