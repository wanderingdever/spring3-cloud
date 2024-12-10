package com.easy.system.constant;

/**
 * 微信相关静态类
 * </p>
 *
 * @author Matt
 */
public interface WeChatConstants {


    /**
     * 微信获取token的URL
     */
    String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s";

    /**
     * 登录凭证校验。通过 wx.login 接口获得临时登录凭证 code 后传到开发者服务器调用此接口完成登录流程。
     * 小程序 appId
     * secret 程序 appSecret
     * js_code 登录时获取的 code，可通过wx.login获取
     * grant_type 授权类型，此处只需填写 authorization_code
     */
    String SESSION_KEY_URL = "https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code";

    /**
     * 获取用户手机号
     */
    String GET_USER_PHONE_NUMBER_URL = "https://api.weixin.qq.com/wxa/business/getuserphonenumber?access_token=%s";

    /**
     * 微信appid
     */
    String APPID_CONFIG_KEY = "wechat_appid";

    /**
     * 微信secret
     */
    String SECRET_CONFIG_KEY = "wechat_secret";
}