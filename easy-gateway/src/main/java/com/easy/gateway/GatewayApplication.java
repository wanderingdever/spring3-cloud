package com.easy.gateway;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.util.Arrays;

/**
 * 网关启动
 * </p>
 *
 * @author Matt
 */
@SpringBootApplication(scanBasePackages = {"com.easy.gateway"})
@EnableDiscoveryClient
public class GatewayApplication {
    private final static Logger LOGGER = LoggerFactory.getLogger(GatewayApplication.class);

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(GatewayApplication.class);
        ConfigurableApplicationContext run = app.run(args);
        Environment env = run.getEnvironment();
        String severPort = env.getProperty("server.port");
        LOGGER.info("\n" +
                " ██████╗  █████╗ ████████╗███████╗██╗    ██╗ █████╗ ██╗   ██╗\n" +
                "██╔════╝ ██╔══██╗╚══██╔══╝██╔════╝██║    ██║██╔══██╗╚██╗ ██╔╝\n" +
                "██║  ███╗███████║   ██║   █████╗  ██║ █╗ ██║███████║ ╚████╔╝ \n" +
                "██║   ██║██╔══██║   ██║   ██╔══╝  ██║███╗██║██╔══██║  ╚██╔╝  \n" +
                "╚██████╔╝██║  ██║   ██║   ███████╗╚███╔███╔╝██║  ██║   ██║   \n" +
                " ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   \n" +
                "PROFILE: " + Arrays.toString(env.getActiveProfiles()) + "\n" +
                "SERVER PORT: " + severPort + "\n");
    }
}