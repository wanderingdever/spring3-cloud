package com.hk.api.fallback;

import com.hk.api.service.RemoteUserService;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 用户降级
 * </p>
 *
 * @author Matt
 */
@Component
public class UserFallbackFactory implements FallbackFactory<RemoteUserService> {

    @Override
    public RemoteUserService create(Throwable cause) {
        return null;
    }
}