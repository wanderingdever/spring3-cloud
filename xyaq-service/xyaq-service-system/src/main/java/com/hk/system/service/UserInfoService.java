package com.hk.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.framework.enums.DelEnum;
import com.hk.system.bean.dto.user.UserAddDTO;
import com.hk.system.bean.dto.user.UserEditDTO;
import com.hk.system.bean.pojo.UserInfo;
import com.hk.system.dao.UserInfoMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoService extends ServiceImpl<UserInfoMapper, UserInfo> {

    public void add(UserAddDTO dto, String userId) {

        // 额外信息
        UserInfo userInfo = new UserInfo();
        BeanUtils.copyProperties(dto, userInfo);
        userInfo.setUserId(userId);
        save(userInfo);
    }

    public void update(UserEditDTO dto) {

        // 用户信息
        UserInfo userInfo = new UserInfo();
        BeanUtils.copyProperties(dto, userInfo);
        userInfo.setUserId(dto.getId());
        // 更新用户信息
        String userInfoId = this.baseMapper.getIdByUserId(dto.getId());
        userInfo.setId(userInfoId);
        this.baseMapper.updateById(userInfo);
    }

    public void del(List<String> userIdList) {

        lambdaUpdate()
                .in(UserInfo::getUserId, userIdList)
                .set(UserInfo::getDel, DelEnum.DELETE.getCode())
                .update();
    }
}