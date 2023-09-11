package com.easy.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.util.Arrays;

/**
 * 授权启动
 * </p>
 *
 * @author Matt
 */
@SpringBootApplication
public class AuthorizeApplication {

    private final static Logger LOGGER = LoggerFactory.getLogger(AuthorizeApplication.class);

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(AuthorizeApplication.class);
        ConfigurableApplicationContext run = app.run(args);
        Environment env = run.getEnvironment();
        String severPort = env.getProperty("server.port");
        LOGGER.info("\n" +
                " █████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ██████╗ ██╗███████╗███████╗\n" +
                "██╔══██╗██║   ██║╚══██╔══╝██║  ██║██╔═══██╗██╔══██╗██║╚══███╔╝██╔════╝\n" +
                "███████║██║   ██║   ██║   ███████║██║   ██║██████╔╝██║  ███╔╝ █████╗  \n" +
                "██╔══██║██║   ██║   ██║   ██╔══██║██║   ██║██╔══██╗██║ ███╔╝  ██╔══╝  \n" +
                "██║  ██║╚██████╔╝   ██║   ██║  ██║╚██████╔╝██║  ██║██║███████╗███████╗\n" +
                "╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝\n" +
                "PROFILE: " + Arrays.toString(env.getActiveProfiles()) + "\n" +
                "SERVER PORT: " + severPort + "\n");
    }
}