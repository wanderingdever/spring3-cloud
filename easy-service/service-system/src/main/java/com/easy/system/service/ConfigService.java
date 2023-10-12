package com.easy.system.service;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easy.api.service.RemoteConfigService;
import com.easy.api.vo.ConfigVO;
import com.easy.datasource.utils.PageUtil;
import com.easy.redis.constant.CacheConstants;
import com.easy.redis.utils.RedisUtils;
import com.easy.system.bean.dto.config.ConfigDTO;
import com.easy.system.bean.dto.config.ConfigSearchDTO;
import com.easy.system.bean.pojo.Config;
import com.easy.system.dao.ConfigMapper;
import com.easy.utils.json.JacksonUtil;
import com.easy.utils.lang.StringUtil;
import jakarta.annotation.PostConstruct;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统参数配置
 * </p>
 *
 * @author Matt
 */
@Service
@DubboService(interfaceClass = RemoteConfigService.class)
public class ConfigService extends ServiceImpl<ConfigMapper, Config> implements RemoteConfigService {


    /**
     * 缓存系统参数配置
     */
    @PostConstruct
    public void loadConfigCache() {
        ConfigSearchDTO dto = new ConfigSearchDTO();
        // 默认缓存系统级别
        dto.setIsSystem(true);
        List<Config> list = getList(dto);
        if (StringUtil.isNotEmpty(list)) {
            RedisUtils.setCacheObject(CacheConstants.SYSTEM_CONFIG, JacksonUtil.toJsonString(list));
        }
    }

    /**
     * 查询集合
     *
     * @param dto 入参
     * @return List<Config> {@link com.easy.system.bean.pojo.Config}
     */
    public List<Config> getList(ConfigSearchDTO dto) {
        LambdaQueryWrapper<Config> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(StringUtil.isNotBlank(dto.getConfigName()), Config::getConfigName, dto.getConfigName())
                .eq(StringUtil.isNotBlank(dto.getConfigKey()), Config::getConfigKey, dto.getConfigKey())
                .eq(StringUtil.isNotNull(dto.getIsSystem()), Config::getIsSystem, dto.getIsSystem());
        return baseMapper.selectList(queryWrapper);
    }

    public Page<Config> pageConfig(ConfigSearchDTO dto) {
        return lambdaQuery().like(StringUtil.isNotBlank(dto.getConfigName()), Config::getConfigName, dto.getConfigName())
                .like(StringUtil.isNotBlank(dto.getConfigKey()), Config::getConfigKey, dto.getConfigKey())
                .eq(StringUtil.isNotNull(dto.getIsSystem()), Config::getIsSystem, dto.getIsSystem())
                .page(PageUtil.getPage(dto));
    }

    /**
     * 新增参数配置
     *
     * @param dto 入参
     */
    @Transactional(rollbackFor = Exception.class)
    public void addConfig(ConfigDTO dto) {
        Config newConfig = new Config();
        newConfig.setConfigName(dto.getConfigName());
        newConfig.setConfigKey(dto.getConfigKey());
        newConfig.setConfigValue(dto.getConfigValue());
        newConfig.setIsSystem(dto.getIsSystem());
        this.save(newConfig);
        // 更新系统参数缓存
        if (dto.getIsSystem()) {
            loadConfigCache();
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateConfig(Config config) {
        this.updateById(config);
    }

    @Transactional(rollbackFor = Exception.class)
    public void delConfig(List<String> ids) {
        this.removeByIds(ids);
    }

    /**
     * 获取参数配置
     *
     * @param configKey key
     * @return {@link ConfigVO}
     */
    @Override
    public ConfigVO getConfig(String configKey) {
        ConfigVO result = new ConfigVO();
        // 获取缓存数据
        List<ConfigVO> configList = getCacheConfigList();
        if (StringUtil.isNotEmpty(configList)) {
            // 筛选
            result = configList.stream().filter(config -> config.getConfigKey().equals(configKey)).findFirst().orElse(null);
        }
        // 未筛选到就查询数据库
        if (result == null) {
            LambdaQueryWrapper<Config> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(Config::getConfigKey, configKey);
            Config selectOne = baseMapper.selectOne(queryWrapper);
            if (selectOne != null) {
                BeanUtil.copyProperties(selectOne, result);
            }
        }
        return result;
    }

    public List<ConfigVO> getCacheConfigList() {
        String cacheObject = RedisUtils.getCacheObject(CacheConstants.SYSTEM_CONFIG);
        if (StringUtil.isNotBlank(cacheObject)) {
            return JacksonUtil.jsonToList(cacheObject, ConfigVO.class);
        }
        return null;
    }
}