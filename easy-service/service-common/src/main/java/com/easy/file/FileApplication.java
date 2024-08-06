package com.easy.file;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.util.Arrays;

/**
 * 系统启动类
 *
 * @author matt
 */
@SpringBootApplication(scanBasePackages = {"com.easy.file"})
@EnableDiscoveryClient
@EnableDubbo
public class FileApplication {

    private final static Logger LOGGER = LoggerFactory.getLogger(FileApplication.class);

    public static void main(String[] args) {

        SpringApplication app = new SpringApplication(FileApplication.class);
        ConfigurableApplicationContext run = app.run(args);
        Environment env = run.getEnvironment();
        String severPort = env.getProperty("server.port");
        String logo = """
                ███████╗██╗██╗     ███████╗
                ██╔════╝██║██║     ██╔════╝
                █████╗  ██║██║     █████╗
                ██╔══╝  ██║██║     ██╔══╝
                ██║     ██║███████╗███████╗
                ╚═╝     ╚═╝╚══════╝╚══════╝
                PROFILE: %s
                SERVER PORT: %s""";
        LOGGER.warn("\n" + String.format(logo, Arrays.toString(env.getActiveProfiles()), severPort));
    }
}