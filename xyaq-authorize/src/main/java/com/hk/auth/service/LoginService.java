package com.hk.auth.service;

import com.hk.api.service.RemoteUserService;
import org.springframework.stereotype.Service;

/**
 * 登录服务
 * </p>
 *
 * @author Matt
 */
@Service
public class LoginService {

    private final RemoteUserService remoteUserService;

    public LoginService(RemoteUserService remoteUserService) {
        this.remoteUserService = remoteUserService;
    }


}