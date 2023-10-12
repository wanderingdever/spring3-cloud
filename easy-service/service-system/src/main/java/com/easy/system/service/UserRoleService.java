package com.easy.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.system.bean.pojo.UserRole;
import com.easy.system.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class UserRoleService extends ServiceImpl<UserRoleMapper, UserRole> {

    public List<UserRole> getList(List<String> userIdList, List<String> roleList) {
        List<UserRole> list = new LinkedList<>();
        for (String userId : userIdList) {
            for (String roleId : roleList) {
                list.add(new UserRole(userId, roleId));
            }
        }
        return list;
    }
}