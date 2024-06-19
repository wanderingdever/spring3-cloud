package com.easy.system.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.datasource.bean.dto.IdListDTO;
import com.easy.system.bean.dto.post.PostDTO;
import com.easy.system.bean.dto.post.PostEditDTO;
import com.easy.system.bean.dto.post.PostSearchDTO;
import com.easy.system.bean.vo.post.PostVO;
import com.easy.system.service.PostService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/post")
@Tag(name = "岗位管理")
public class PostController {

    @Resource
    private PostService postService;

    @PostMapping("/list")
    @Operation(summary = "集合查询")
    public List<PostVO> list(@RequestBody PostSearchDTO dto) {
        return postService.list(dto);
    }

    @PostMapping("/page")
    @Operation(summary = "分页查询")
    public Page<PostVO> pagePost(@RequestBody PostSearchDTO dto) {
        return postService.page(dto);
    }

    @PostMapping("/add")
    @Operation(summary = "新增岗位信息")
    public void addPost(@Valid @RequestBody PostDTO dto) {
        postService.add(dto);
    }

    @PostMapping("/update")
    @Operation(summary = "更新岗位信息")
    public void updatePost(@Valid @RequestBody PostEditDTO dto) {
        postService.update(dto);
    }

    @PostMapping("/del")
    @Operation(summary = "删除岗位信息")
    public void delPost(@RequestBody IdListDTO dto) {
        postService.del(dto);
    }
}