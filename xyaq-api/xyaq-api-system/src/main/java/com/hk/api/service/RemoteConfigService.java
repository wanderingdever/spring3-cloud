package com.hk.api.service;

import com.hk.api.vo.ConfigVO;

/**
 * 系统参数配置
 * </p>
 *
 * @author Matt
 */
public interface RemoteConfigService {
    /**
     * 获取参数配置
     *
     * @param configKey key
     * @return {@link ConfigVO}
     */
    ConfigVO getConfig(String configKey);
}