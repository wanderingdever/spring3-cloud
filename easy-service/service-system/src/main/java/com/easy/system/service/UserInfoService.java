package com.easy.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.framework.enums.DelEnum;
import com.easy.system.bean.dto.user.UserDTO;
import com.easy.system.bean.dto.user.UserEditDTO;
import com.easy.system.bean.pojo.UserInfo;
import com.easy.system.dao.UserInfoMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * </p>
 *
 * @author Matt
 */
@Service
public class UserInfoService extends ServiceImpl<UserInfoMapper, UserInfo> {

    public void add(UserDTO dto, String userId) {
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

    public void del(String userId) {
        lambdaUpdate()
                .in(UserInfo::getUserId, userId)
                .set(UserInfo::getDel, DelEnum.DELETE.getCode())
                .update();
    }
}