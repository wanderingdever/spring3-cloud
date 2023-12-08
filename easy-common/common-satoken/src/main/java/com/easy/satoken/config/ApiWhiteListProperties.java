package com.easy.satoken.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * 白名单
 *
 * @author Matt
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "api-whitelist")
public class ApiWhiteListProperties {
    /**
     * 白名单url集合
     */
    private List<String> url = new ArrayList<>();

    public String[] getUrlAllArray() {
        return getUrl().toArray(new String[0]);
    }

}