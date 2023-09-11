package com.hk;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

import java.util.Arrays;

@Slf4j
@SpringBootApplication(scanBasePackages = {"com.hk.gateway"})
@EnableDiscoveryClient
public class SystemApplication {

    public static void main(String[] args) {

        SpringApplication app = new SpringApplication(SystemApplication.class);
        ConfigurableApplicationContext run = app.run(args);
        Environment env = run.getEnvironment();
        String severPort = env.getProperty("server.port");
        log.info("\n" +
                """
                                ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
                                ██╔════╝╚██╗ ██╔╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║
                                ███████╗ ╚████╔╝ ███████╗   ██║   █████╗  ██╔████╔██║
                                ╚════██║  ╚██╔╝  ╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║
                                ███████║   ██║   ███████║   ██║   ███████╗██║ ╚═╝ ██║
                                ╚══════╝   ╚═╝   ╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝                             
                        """ +
                "PROFILE: " + Arrays.toString(env.getActiveProfiles()) + "\n" +
                "SERVER PORT: " + severPort + "\n");
    }
}