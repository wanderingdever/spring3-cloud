package com.hk.framework.config;

import feign.Logger;
import feign.RequestInterceptor;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Enumeration;

/**
 * feign配置
 *
 * @author Matt
 */
@Configuration
public class FeignConfig {
    @Bean
    public RequestInterceptor headerInterceptor() {
        return requestTemplate -> {
            // 此种方式是线程安全的
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
                    .getRequestAttributes();
            // 不为空时取出请求中的header 原封不动的设置到feign请求中
            if (null != attributes) {
                HttpServletRequest request = attributes.getRequest();
                // 遍历设置 也可从request取出整个Header 写到RequestTemplate 中
                Enumeration<String> headerNames = request.getHeaderNames();
                if (headerNames != null) {
                    while (headerNames.hasMoreElements()) {
                        String name = headerNames.nextElement();
                        if (!"content-length".equals(name)) {
                            String values = request.getHeader(name);
                            requestTemplate.header(name, values);
                        }

                    }
                }
            }
        };
    }

    @Bean
    public Logger.Level feignLogLevel() {
        return Logger.Level.FULL;
    }
}