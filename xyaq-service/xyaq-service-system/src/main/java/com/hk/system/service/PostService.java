package com.hk.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.utils.PageUtil;
import com.hk.system.bean.dto.PostDTO;
import com.hk.system.bean.dto.PostSearchDTO;
import com.hk.system.bean.pojo.Post;
import com.hk.system.bean.pojo.UserPost;
import com.hk.system.dao.PostMapper;
import com.hk.utils.lang.StringUtil;
import com.hk.web.exception.CustomizeException;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
public class PostService extends ServiceImpl<PostMapper, Post> {

    private final UserPostService userPostService;


    public Page<Post> pagePost(PostSearchDTO dto) {
        return lambdaQuery()
                .like(StringUtil.isNotBlank(dto.getPostName()), Post::getPostName, dto.getPostName())
                .eq(StringUtil.isNotBlank(dto.getPostCode()), Post::getPostCode, dto.getPostCode())
                .eq(StringUtil.isNotNull(dto.getEnable()), Post::getEnable, dto.getEnable())
                .orderByAsc(Post::getPostSort)
                .page(PageUtil.getPage(dto));
    }

    public void addPost(PostDTO dto) {
        Post post = new Post();
        BeanUtils.copyProperties(dto, post);
        save(post);
    }

    /**
     * 更新岗位信息
     *
     * @param post {@link Post}
     */
    public void updatePost(Post post) {
        updateById(post);
    }

    /**
     * 通过岗位ID 删除岗位信息
     *
     * @param id
     */
    public void delPost(String id) {
        Long count = userPostService.lambdaQuery().eq(UserPost::getPostId, id).count();
        if (count > 0) {
            throw new CustomizeException("删除失败,所选岗位已分配!");
        }
        removeById(id);
    }
}