package com.hk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hk.system.bean.dto.MenuListDTO;
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
     * 获取菜单列表
     *
     * @param search 查询条件
     * @return {@link List<MenuTreeVO> }
     */
    List<MenuTreeVO> getMenuList(@Param("search") MenuListDTO search);

}