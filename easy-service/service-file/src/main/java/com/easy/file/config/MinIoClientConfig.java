package com.easy.file.config;

import io.minio.MinioClient;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * minio配置类
 * </p>
 *
 * @author Matt
 */
@Getter
@Component
public class MinIoClientConfig {

    /**
     * 服务地址
     */
    @Value("${minio.endpoint}")
    private String endpoint;
    /**
     * 用户名
     */
    @Value("${minio.accessKey}")
    private String accessKey;
    /**
     * 密码
     */
    @Value("${minio.secretKey}")
    private String secretKey;

    /**
     * 存储桶名称
     */
    @Value("${minio.bucketName}")
    private String bucketName;

    /**
     * 预览到期时间（分钟）
     */
    @Value("${minio.previewExpiry}")
    private Integer previewExpiry;


    /**
     * 注入minio 客户端
     */
    @Bean
    public MinioClient minioClient() {
        return MinioClient.builder()
                .endpoint(endpoint)
                .credentials(accessKey, secretKey)
                .build();
    }
}