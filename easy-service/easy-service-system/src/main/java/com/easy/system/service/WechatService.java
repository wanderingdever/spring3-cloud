package com.easy.system.service;

import com.easy.core.exception.CustomizeException;
import com.easy.system.bean.vo.weChat.WeChatAccessTokenVO;
import com.easy.system.bean.vo.weChat.WeChatSessionKeyVO;
import com.easy.system.constant.WeChatConstants;
import com.easy.utils.http.OkHttpUtil;
import com.easy.utils.json.JacksonUtils;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 微信相关服务
 * </p>
 *
 * @author Matt
 */
@Service
public class WechatService {


    private final ConfigService configService;

    public WechatService(ConfigService configService) {
        this.configService = configService;
    }

    /**
     * 获取微信access_token
     * access_token 的存储与更新
     * access_token 的存储至少要保留 512 个字符空间；
     * access_token 的有效期目前为 2 个小时，需定时刷新，重复获取将导致上次获取的 access_token 失效；
     * 建议开发者使用中控服务器统一获取和刷新 access_token，其他业务逻辑服务器所使用的 access_token 均来自于该中控服务器，不应该各自去刷新，否则容易造成冲突，导致 access_token 覆盖而影响业务；
     * access_token 的有效期通过返回的 expires_in 来传达，目前是7200秒之内的值，中控服务器需要根据这个有效时间提前去刷新。在刷新过程中，中控服务器可对外继续输出的老 access_token，此时公众平台后台会保证在5分钟内，新老 access_token 都可用，这保证了第三方业务的平滑过渡；
     * access_token 的有效时间可能会在未来有调整，所以中控服务器不仅需要内部定时主动刷新，还需要提供被动刷新 access_token 的接口，这样便于业务服务器在API调用获知 access_token 已超时的情况下，可以触发 access_token 的刷新流程。
     *
     * @return access_token
     */
    public String getAccessToken() {

        // 如上 取出配置的appid和secret
        String appid = configService.getConfigValue(WeChatConstants.APPID_CONFIG_KEY);
        String secret = configService.getConfigValue(WeChatConstants.SECRET_CONFIG_KEY);
        if (appid == null || secret == null) {
            throw new CustomizeException("微信配置错误");
        }
        // 组装url
        String url = String.format(WeChatConstants.ACCESS_TOKEN_URL, appid, secret);
        // 请求接口
        String sync = OkHttpUtil.builder().url(url).get().sync();
        WeChatAccessTokenVO accessToken = JacksonUtils.parseObject(sync, WeChatAccessTokenVO.class);
        // 响应数据
        if (accessToken != null && accessToken.getAccessToken() != null) {
            return accessToken.getAccessToken();
        }
        throw new CustomizeException("获取access_token失败:" + Objects.requireNonNull(accessToken).getErrCode());
    }

    /**
     * 登录凭证校验
     *
     * @param code 登录时获取的 code
     * @return {@link WeChatSessionKeyVO }
     */
    public WeChatSessionKeyVO getSessionKeyOrOpenId(String code) {
        // 如上 取出配置的appid和secret
        String appid = configService.getConfigValue(WeChatConstants.APPID_CONFIG_KEY);
        String secret = configService.getConfigValue(WeChatConstants.SECRET_CONFIG_KEY);
        if (appid == null || secret == null) {
            throw new CustomizeException("微信配置错误");
        }
        // 组装url
        String url = String.format(WeChatConstants.SESSION_KEY_URL, appid, secret, code);
        // 请求接口
        String sync = OkHttpUtil.builder().url(url).get().sync();
        WeChatSessionKeyVO sessionKey = JacksonUtils.parseObject(sync, WeChatSessionKeyVO.class);
        // 响应数据
        if (sessionKey != null && sessionKey.getErrCode() != 0) {
            throw new CustomizeException("登录凭证校验失败:" + sessionKey.getErrCode());
        }
        return sessionKey;
    }

    /**
     * 获取用户手机号
     *
     * @param accessToken 微信授权token
     * @param code        用户授权代码
     * @return 用户手机号 String
     */
    public String getUserPhoneNumber(String accessToken, String code) {
        // 获取access_token
        String url = String.format(WeChatConstants.GET_USER_PHONE_NUMBER_URL, accessToken);
        // 请求接口
        String sync = OkHttpUtil.builder().url(url).addParam("code", code).post(true).sync();
        JsonNode rootNode = JacksonUtils.parseObject(sync, JsonNode.class);
        JsonNode phoneInfoNode = rootNode.path("phone_info");
        // 异常处理
        if (phoneInfoNode.isMissingNode()) {
            throw new CustomizeException("获取用户手机号失败:" + rootNode.get("errcode").asText());
        }
        // 提取手机号码
        return phoneInfoNode.path("phoneNumber").asText();

    }

}