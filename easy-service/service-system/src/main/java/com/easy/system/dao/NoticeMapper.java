package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.system.bean.dto.notice.NoticeSearchDTO;
import com.easy.system.bean.pojo.Notice;
import com.easy.system.bean.vo.notice.UserNoticeVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 分页查询用户消息通知
     *
     * @param page 分页
     * @param dto  查询参数
     * @return List<Notice>
     */
    List<UserNoticeVO> userPageNotice(@Param("page") Page<UserNoticeVO> page, @Param("dto") NoticeSearchDTO dto);
}