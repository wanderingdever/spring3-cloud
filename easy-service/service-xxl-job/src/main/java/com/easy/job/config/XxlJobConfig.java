package com.easy.job.config;


import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * xxl调度配置
 * </p>
 *
 * @author Matt
 */
@Component
@Slf4j
public class XxlJobConfig {

    @Value("${xxl.job.admin.addresses}")
    private String adminAddresses;


    @Value("${xxl.job.executor.app-name}")
    private String appName;

    @Value("${xxl.job.executor.access-token}")
    private String accessToken;

    @Value("${xxl.job.executor.ip}")
    private String ip;
    /**
     * 后台端口
     */
    @Value("${xxl.job.executor.port}")
    private Integer port;

    /**
     * 日志文件路径
     */
    @Value("${xxl.job.executor.log-path}")
    private String logPath;

    /**
     * 日志保留天数
     */
    @Value("${xxl.job.executor.log-retention-days}")
    private Integer logRetentionDays;

    @Bean(initMethod = "start", destroyMethod = "destroy")
    public XxlJobSpringExecutor xxlJobExecutor() {
        log.info(">>>>>>>>>>> xxl-job config init.");
        XxlJobSpringExecutor xxlJobSpringExecutor = new XxlJobSpringExecutor();
        xxlJobSpringExecutor.setAdminAddresses(adminAddresses);
        xxlJobSpringExecutor.setAppname(appName);
        xxlJobSpringExecutor.setAccessToken(accessToken);
        xxlJobSpringExecutor.setIp(ip);
        xxlJobSpringExecutor.setPort(port);
        // 日志文件路径
        xxlJobSpringExecutor.setLogPath(logPath);
        // 日志保留天数
        xxlJobSpringExecutor.setLogRetentionDays(logRetentionDays);
        return xxlJobSpringExecutor;
    }
}