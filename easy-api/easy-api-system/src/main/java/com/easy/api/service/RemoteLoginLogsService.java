package com.easy.api.service;

import com.easy.api.vo.LoginLogsVO;

/**
 * 登录日志
 * </p>
 *
 * @author Matt
 */
public interface RemoteLoginLogsService {


    void saveLoginLogs(LoginLogsVO loginLogs);
}