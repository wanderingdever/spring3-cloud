package com.easy.job;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.util.Arrays;

/**
 * 任务调度
 * </p>
 *
 * @author Matt
 */
@SpringBootApplication(scanBasePackages = {"com.easy.job"})
@EnableDiscoveryClient
public class XxlJobApplication {

    private final static Logger LOGGER = LoggerFactory.getLogger(XxlJobApplication.class);

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(XxlJobApplication.class);
        ConfigurableApplicationContext run = app.run(args);
        Environment env = run.getEnvironment();
        String severPort = env.getProperty("server.port");
        String logo = """
                     ██╗ ██████╗ ██████╗
                     ██║██╔═══██╗██╔══██╗
                     ██║██║   ██║██████╔╝
                ██   ██║██║   ██║██╔══██╗
                ╚█████╔╝╚██████╔╝██████╔╝
                 ╚════╝  ╚═════╝ ╚═════╝
                PROFILE: %s
                SERVER PORT: %s""";
        LOGGER.warn("\n" + String.format(logo, Arrays.toString(env.getActiveProfiles()), severPort));
    }
}