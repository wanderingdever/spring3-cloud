package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.dto.menu.MenuListDTO;
import com.easy.system.bean.pojo.Menu;
import com.easy.system.bean.vo.MenuTreeVO;
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

    List<MenuTreeVO> getAllMenuList(@Param("search") MenuListDTO search);
}