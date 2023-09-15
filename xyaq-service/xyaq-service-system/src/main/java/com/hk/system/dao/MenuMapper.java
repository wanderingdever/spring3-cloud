package com.hk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hk.system.bean.pojo.Menu;
import com.hk.system.bean.vo.MenuTreeVO;
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
public interface MenuMapper extends BaseMapper<Menu> {
    /**
     * 获取用户路由(按钮除外)
     *
     * @param userId 用户id
     * @return {@link List<MenuTreeVO> }
     */
    List<MenuTreeVO> getUserRouter(@Param("userId") String userId);
}