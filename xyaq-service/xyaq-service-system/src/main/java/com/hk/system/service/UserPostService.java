package com.hk.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.system.bean.pojo.UserPost;
import com.hk.system.dao.UserPostMapper;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class UserPostService extends ServiceImpl<UserPostMapper, UserPost> {

    public List<UserPost> getList(List<String> userIdList, List<String> postIdList) {

        List<UserPost> list = new LinkedList<>();
        for (String userId : userIdList) {
            for (String postId : postIdList) {
                list.add(new UserPost(userId, postId));
            }
        }
        return list;
    }
}