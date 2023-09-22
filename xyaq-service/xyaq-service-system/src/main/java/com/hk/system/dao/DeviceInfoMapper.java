package com.hk.system.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hk.datasource.annotation.PermissionFilter;
import com.hk.system.bean.pojo.DeviceInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Mapper
public interface DeviceInfoMapper extends BaseMapper<DeviceInfo> {

    @PermissionFilter
    @Select("SELECT * FROM xyaq_device_info")
    List<DeviceInfo> allList();
}