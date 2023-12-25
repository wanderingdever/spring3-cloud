package com.easy.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.datasource.bean.dto.IdDTO;
import com.easy.datasource.utils.PageUtil;
import com.easy.system.bean.dto.notice.NoticeAddDTO;
import com.easy.system.bean.dto.notice.NoticeEditDTO;
import com.easy.system.bean.dto.notice.NoticeSearchDTO;
import com.easy.system.bean.pojo.Notice;
import com.easy.system.bean.pojo.User;
import com.easy.system.bean.pojo.UserNotice;
import com.easy.system.bean.vo.notice.NoticeVO;
import com.easy.system.dao.NoticeMapper;
import com.easy.utils.lang.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class NoticeService extends ServiceImpl<NoticeMapper, Notice> {

    private final UserNoticeService userNoticeService;
    private final UserService userService;

    public NoticeService(UserNoticeService userNoticeService, UserService userService) {
        this.userNoticeService = userNoticeService;
        this.userService = userService;
    }

    public Page<Notice> pageNotice(NoticeSearchDTO dto) {
        return lambdaQuery().like(StringUtil.isNotBlank(dto.getTitle()), Notice::getTitle, dto.getTitle())
                .eq(StringUtil.isNotBlank(dto.getType()), Notice::getType, dto.getType())
                .eq(StringUtil.isNotNull(dto.getStatus()), Notice::getStatus, dto.getStatus())
                .page(PageUtil.getPage(dto));
    }

    @Transactional(rollbackFor = Exception.class)
    public void addNotice(NoticeAddDTO dto) {
        // 核实ID
        List<User> userIds = userService.lambdaQuery().in(User::getId, dto.getUserIds()).list();
        Notice notice = new Notice();
        notice.setTitle(dto.getTitle());
        notice.setType(dto.getType());
        notice.setContent(dto.getContent());
        notice.setStatus(dto.getStatus());
        save(notice);
        if (!userIds.isEmpty()) {
            userNoticeService.saveBatch(userIds.stream().map(user -> new UserNotice(user.getId(), notice.getId(), notice.getStatus())).collect(Collectors.toSet()));
        }
    }

    public NoticeVO get(IdDTO dto) {
        NoticeVO noticeVO = BeanUtil.copyProperties(getById(dto.getId()), NoticeVO.class);
        List<UserNotice> userList = userNoticeService.lambdaQuery().eq(UserNotice::getNoticeId, dto.getId()).list();
        if (!userList.isEmpty()) {
            noticeVO.setUserIds(userList.stream().map(UserNotice::getUserId).collect(Collectors.toList()));
        }
        return noticeVO;
    }

    public void editNotice(NoticeEditDTO dto) {
        List<User> userIds = userService.lambdaQuery().in(User::getId, dto.getUserIds()).list();
        Notice notice = new Notice();
        notice.setId(dto.getId());
        notice.setTitle(dto.getTitle());
        notice.setType(dto.getType());
        notice.setContent(dto.getContent());
        notice.setStatus(dto.getStatus());
        updateById(notice);
        if (!userIds.isEmpty()) {
            // 删除原来的
            userNoticeService.getBaseMapper().deleteByNoticeId(dto.getId());
            // 插入新数据
            userNoticeService.saveBatch(userIds.stream().map(user -> new UserNotice(user.getId(), notice.getId(), notice.getStatus())).collect(Collectors.toSet()));
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void del(IdDTO dto) {
        // 删除记录
        this.getBaseMapper().removeById(dto.getId());
        // 删除原来的
        userNoticeService.getBaseMapper().deleteByNoticeId(dto.getId());
    }
}