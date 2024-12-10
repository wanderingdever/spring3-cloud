package com.easy.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.system.bean.pojo.Org;
import com.easy.system.bean.vo.org.OrgUserTreeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface OrgMapper extends BaseMapper<Org> {

    List<OrgUserTreeVO> selectTheOrgInfoInTheUserOrg();
}