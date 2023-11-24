package com.easy.gateway.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

/**
 * 图片验证码配置
 * </p>
 *
 * @author Matt
 */
@Configuration
public class CaptchaConfig {

    private static final String KAPTCHA_BORDER = "kaptcha.border";
    private static final String KAPTCHA_TEXTPRODUCER_FONT_COLOR = "kaptcha.textproducer.font.color";
    private static final String KAPTCHA_TEXTPRODUCER_CHAR_SPACE = "kaptcha.textproducer.char.space";
    private static final String KAPTCHA_IMAGE_WIDTH = "kaptcha.image.width";
    private static final String KAPTCHA_IMAGE_HEIGHT = "kaptcha.image.height";
    private static final String KAPTCHA_TEXTPRODUCER_CHAR_LENGTH = "kaptcha.textproducer.char.length";
    private static final Object KAPTCHA_IMAGE_FONT_SIZE = "kaptcha.textproducer.font.size";
    private static final Object KAPTCHA_NOISE_COLOR = "kaptcha.noise.color";
    private static final Object KAPTCHA_OBSCURIFICATOR_IMPL = "kaptcha.obscurificator.impl";
    /**
     * 默认图片样式
     */
    private static final String DEFAULT_OBSCURIFICATOR_IMPL = "com.google.code.kaptcha.impl.WaterRipple";
    /**
     * 默认生成图形验证码宽度
     */
    private static final String DEFAULT_IMAGE_WIDTH = "120";
    /**
     * 默认生成图像验证码高度
     */
    private static final String DEFAULT_IMAGE_HEIGHT = "40";
    /**
     * 文字颜色，合法值： r,g,b (and optional alpha) 或者 white,black,blue.
     */
    private static final String DEFAULT_COLOR_FONT = "blue";
    /**
     * 图片边框
     */
    private static final String DEFAULT_IMAGE_BORDER = "no";
    /**
     * 默认图片间隔
     */
    private static final String DEFAULT_CHAR_SPACE = "5";
    /**
     * 验证码文字大小
     */
    private static final String DEFAULT_IMAGE_FONT_SIZE = "30";

    @Bean
    public DefaultKaptcha producer() {
        Properties properties = new Properties();
        properties.put(KAPTCHA_OBSCURIFICATOR_IMPL, DEFAULT_OBSCURIFICATOR_IMPL);
        properties.put(KAPTCHA_BORDER, DEFAULT_IMAGE_BORDER);
        properties.put(KAPTCHA_TEXTPRODUCER_FONT_COLOR, DEFAULT_COLOR_FONT);
        properties.put(KAPTCHA_TEXTPRODUCER_CHAR_SPACE, DEFAULT_CHAR_SPACE);
        properties.put(KAPTCHA_IMAGE_WIDTH, DEFAULT_IMAGE_WIDTH);
        properties.put(KAPTCHA_IMAGE_HEIGHT, DEFAULT_IMAGE_HEIGHT);
        properties.put(KAPTCHA_IMAGE_FONT_SIZE, DEFAULT_IMAGE_FONT_SIZE);
        // FIXME 验证码长度
        properties.put(KAPTCHA_TEXTPRODUCER_CHAR_LENGTH, 5);
        properties.put(KAPTCHA_NOISE_COLOR, DEFAULT_COLOR_FONT);
        Config config = new Config(properties);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}