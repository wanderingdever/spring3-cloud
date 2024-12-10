package com.easy.common.config;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.region.Region;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 腾讯云cos配置
 * </p>
 *
 * @author Matt
 */
@Getter
@Configuration
@ConditionalOnProperty(name = "file.storage", havingValue = "tencent")
public class TencentCosConfig {

    @Value("${file.tencent.cos.url}")
    private String url;

    @Value("${file.tencent.cos.secret-id}")
    private String secretId;

    @Value("${file.tencent.cos.secret-key}")
    private String secretKey;

    @Value("${file.tencent.cos.region}")
    private String region;

    @Value("${file.tencent.cos.bucket-name}")
    private String bucketName;

    @Bean
    public COSClient cosClient() {
        // 获取腾讯云COS的凭据
        COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
        // 创建客户端配置实例
        ClientConfig clientConfig = new ClientConfig(new Region(region));
        // 创建COS客户端实例
        return new COSClient(cred, clientConfig);
    }
}