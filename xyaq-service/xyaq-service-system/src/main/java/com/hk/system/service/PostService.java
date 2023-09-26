package com.hk.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.datasource.bean.dto.IdListDTO;
import com.hk.datasource.utils.PageUtil;
import com.hk.framework.exception.CustomizeException;
import com.hk.satoken.service.DataScopeService;
import com.hk.system.bean.dto.PostSearchDTO;
import com.hk.system.bean.dto.post.PostDTO;
import com.hk.system.bean.dto.post.PostEditDTO;
import com.hk.system.bean.pojo.Post;
import com.hk.system.bean.pojo.UserPost;
import com.hk.system.bean.vo.post.PostVO;
import com.hk.system.dao.PostMapper;
import com.hk.utils.lang.StringUtil;
import jakarta.annotation.Resource;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
@AllArgsConstructor
public class PostService extends ServiceImpl<PostMapper, Post> {

    @Resource
    private UserPostService userPostService;

    @Resource
    private DataScopeService dataScopeService;

    public List<PostVO> list(PostSearchDTO dto) {

        return lambdaQuery()
                .like(StringUtils.isNotBlank(dto.getPostName()), Post::getPostName, dto.getPostName())
                .eq(StringUtils.isNotBlank(dto.getPostCode()), Post::getPostCode, dto.getPostCode())
                .eq(StringUtils.isNotBlank(dto.getIsRotation()), Post::getIsRotation, dto.getIsRotation())
                .eq(Objects.nonNull(dto.getEnable()), Post::getEnable, dto.getEnable())
                .in(Post::getOrgId, dataScopeService.authorizedOrgIdList())
                .list()
                .stream()
                .map(this::toPostVO)
                .toList();
    }

    private PostVO toPostVO(Post post) {

        PostVO vo = new PostVO();
        BeanUtils.copyProperties(post, vo);
        return vo;
    }

    public Page<PostVO> page(PostSearchDTO dto) {

        Page<Post> page = lambdaQuery()
                .like(StringUtil.isNotBlank(dto.getPostName()), Post::getPostName, dto.getPostName())
                .eq(StringUtil.isNotBlank(dto.getPostCode()), Post::getPostCode, dto.getPostCode())
                .eq(StringUtil.isNotNull(dto.getEnable()), Post::getEnable, dto.getEnable())
                .orderByAsc(Post::getPostSort)
                .page(PageUtil.getPage(dto));
        return PageUtil.getPage(page, PostVO.class);
    }

    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void add(PostDTO dto) {

        Post post = new Post();
        BeanUtils.copyProperties(dto, post);
        // TODO 新增轮值信息
        save(post);
    }

    /**
     * 更新岗位信息
     *
     * @param post {@link Post}
     */
    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void update(PostEditDTO dto) {

        Post post = new Post();
        BeanUtils.copyProperties(dto, post);
        updateById(post);
    }

    /**
     * 通过岗位ID 删除岗位信息
     *
     * @param id
     */
    @Transactional(rollbackFor = Exception.class, timeout = 5)
    public void del(IdListDTO dto) {
        Long count = userPostService.lambdaQuery().in(UserPost::getPostId, dto.getIdList()).count();
        if (count > 0) {
            throw new CustomizeException("删除失败,所选岗位已分配!");
        }
        removeBatchByIds(dto.getIdList());
    }
}