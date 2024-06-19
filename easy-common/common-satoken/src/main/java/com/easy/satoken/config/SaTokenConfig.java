package com.easy.satoken.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import com.easy.satoken.stp.StpAdminUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 路由权限拦截
 * </p>
 *
 * @author Matt
 */
@Configuration
public class SaTokenConfig implements WebMvcConfigurer {

    private final ApiWhiteListProperties whiteList;

    public SaTokenConfig(ApiWhiteListProperties whiteList) {
        this.whiteList = whiteList;
    }

    // 注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册 Sa-Token 拦截器，校验规则为 StpUtil.checkLogin() 登录校验。
        registry.addInterceptor(new SaInterceptor(handle -> StpAdminUtil.checkLogin()))
                .addPathPatterns("/**")
                .excludePathPatterns(whiteList.getUrlAllArray())
                // 手动放行
                .excludePathPatterns("/**/*.js", "/lang/*.json", "/**/*.css", "/**/*.js", "/**/*.map", "/**/*.html", "/**/*.png",
                        "/**/*.ico", "/**/*.jpg", "/favicon.ico", "/doc.html", "/webjars/**", "/swagger**/**", "/v2/**", "/v3/**");
    }

}