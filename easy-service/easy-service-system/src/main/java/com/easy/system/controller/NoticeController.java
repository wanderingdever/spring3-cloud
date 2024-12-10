package com.easy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easy.core.constant.Constants;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.system.bean.dto.notice.NoticeAddDTO;
import com.easy.system.bean.dto.notice.NoticeEditDTO;
import com.easy.system.bean.dto.notice.NoticeSearchDTO;
import com.easy.system.bean.pojo.Notice;
import com.easy.system.bean.vo.notice.NoticeVO;
import com.easy.system.bean.vo.notice.UserNoticeVO;
import com.easy.system.service.NoticeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * 消息
 * </p>
 *
 * @author Matt
 */
@RestController
@RequestMapping("/notice")
@Tag(name = "通知消息")
public class NoticeController {

    private final NoticeService noticeService;

    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    /**
     * 用户消息 分页查询
     *
     * @param dto 查询入参
     * @return IPage<Notice>
     */
    @PostMapping("/user_page")
    @Operation(summary = "用户消息-分页查询")
    public Page<UserNoticeVO> userPageNotice(@RequestBody NoticeSearchDTO dto) {
        return noticeService.userPageNotice(dto);
    }

    /**
     * 设置用户消息全部已读
     */
    @PostMapping("/user_read")
    @Operation(summary = "设置用户消息全部已读")
    public String userRead(@RequestBody IdDTO dto) {
        noticeService.userRead(dto);
        return "";
    }

    @PostMapping("/get")
    @Operation(summary = "获取单个消息通知数据")
    @SaCheckPermission(value = "system.msg.page", orRole = Constants.ADMIN_ROLE)
    public NoticeVO get(@Valid @RequestBody IdDTO dto) {
        return noticeService.get(dto);

    }

    /**
     * 分页查询
     *
     * @param dto 查询入参
     * @return IPage<Notice>
     */
    @PostMapping("/page")
    @Operation(summary = "分页查询")
    @SaCheckPermission(value = "system.msg.page", orRole = Constants.ADMIN_ROLE)
    public Page<Notice> pageNotice(@RequestBody NoticeSearchDTO dto) {
        return noticeService.pageNotice(dto);
    }

    @PostMapping("/add")
    @Operation(summary = "新增")
    @SaCheckPermission(value = "system.msg.add", orRole = Constants.ADMIN_ROLE)
    public String addNotice(@Valid @RequestBody NoticeAddDTO dto) {
        noticeService.addNotice(dto);
        return "success";
    }

    @PostMapping("/update")
    @Operation(summary = "编辑")
    @SaCheckPermission(value = "system.msg.update", orRole = Constants.ADMIN_ROLE)
    public String editNotice(@Valid @RequestBody NoticeEditDTO dto) {
        noticeService.editNotice(dto);
        return "success";
    }

    @PostMapping("/del")
    @Operation(summary = "删除")
    @SaCheckPermission(value = "system.msg.del", orRole = Constants.ADMIN_ROLE)
    public void del(@RequestBody IdDTO dto) {
        noticeService.del(dto);
    }
}