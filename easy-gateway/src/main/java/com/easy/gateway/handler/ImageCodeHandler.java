package com.easy.gateway.handler;

import com.easy.redis.constant.CacheConstants;
import com.easy.redis.utils.RedisUtils;
import com.google.code.kaptcha.Producer;
import lombok.AllArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.HandlerFunction;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.time.Duration;

/**
 * 图片验证码拦截
 * </p>
 *
 * @author Matt
 */
@AllArgsConstructor
@Component
public class ImageCodeHandler implements HandlerFunction<ServerResponse> {
    private final Producer producer;

    @NotNull
    @Override
    public Mono<ServerResponse> handle(ServerRequest serverRequest) {
        // 生成验证码
        String text = producer.createText();
        BufferedImage image = producer.createImage(text);
        // 保存验证码信息
        String randomStr = serverRequest.queryParam("randomStr").isPresent() ? serverRequest.queryParam("randomStr").get() : "";
        RedisUtils.setCacheObject(CacheConstants.CAPTCHA + randomStr, text, Duration.ofSeconds(60));
        // 转换流信息写出
        try (FastByteArrayOutputStream os = new FastByteArrayOutputStream()) {
            ImageIO.write(image, "jpeg", os);
            return ServerResponse
                    .status(HttpStatus.OK)
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(BodyInserters.fromResource(new ByteArrayResource(os.toByteArray()))).subscribeOn(Schedulers.boundedElastic());
        } catch (Exception e) {
            return Mono.error(e);
        }
    }
}