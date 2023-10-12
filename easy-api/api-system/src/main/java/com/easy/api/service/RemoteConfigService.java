package com.easy.api.service;

import com.easy.api.vo.ConfigVO;

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