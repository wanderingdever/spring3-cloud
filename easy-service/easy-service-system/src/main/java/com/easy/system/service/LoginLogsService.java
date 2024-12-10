package com.easy.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.api.service.RemoteLoginLogsService;
import com.easy.api.vo.LoginLogsVO;
import com.easy.system.bean.pojo.LoginLogs;
import com.easy.system.dao.LoginLogsMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
@DubboService(interfaceClass = RemoteLoginLogsService.class)
public class LoginLogsService extends ServiceImpl<LoginLogsMapper, LoginLogs> implements RemoteLoginLogsService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveLoginLogs(LoginLogsVO loginLogsVO) {
        LoginLogs loginLogs = new LoginLogs();
        BeanUtils.copyProperties(loginLogsVO, loginLogs);
        loginLogs.setCreateBy(loginLogsVO.getUserId());
        save(loginLogs);
    }
}