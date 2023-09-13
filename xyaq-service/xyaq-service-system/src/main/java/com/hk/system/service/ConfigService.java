package com.hk.system.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hk.framework.bean.vo.ConfigVO;
import com.hk.system.bean.pojo.Config;
import com.hk.system.dao.ConfigMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ${desc}
 * </p>
 *
 * @author Matt
 */
@Service
public class ConfigService extends ServiceImpl<ConfigMapper, Config> {

    public List<ConfigVO> getConfig(String key) {
        return null;
    }
}