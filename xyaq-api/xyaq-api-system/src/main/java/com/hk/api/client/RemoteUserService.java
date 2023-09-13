package com.hk.api.client;

import com.hk.framework.config.FeignConfig;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * 用户信息
 * </p>
 *
 * @author Matt
 */
@FeignClient(name = "xyaq-service-system", contextId = "service-system", path = "/api/user", configuration = FeignConfig.class)
public interface RemoteUserService {
}