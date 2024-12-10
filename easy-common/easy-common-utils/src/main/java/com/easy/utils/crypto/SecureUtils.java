package com.easy.utils.crypto;

import org.dromara.hutool.core.codec.binary.Base64;
import org.dromara.hutool.core.util.CharsetUtil;
import org.dromara.hutool.crypto.SecureUtil;
import org.dromara.hutool.crypto.bc.SmUtil;
import org.dromara.hutool.crypto.symmetric.SymmetricCrypto;

import static org.dromara.hutool.crypto.KeyUtil.generateKey;

/**
 * 加密解密工具
 * </p>
 *
 * @author Matt
 */
public class SecureUtils extends SecureUtil {

    private final static String PHONE_SM4_KEY = "2J5zadozy/JENzozCjx1xg==";

    private final static SymmetricCrypto PHONE_SM4 = SmUtil.sm4(Base64.decode(PHONE_SM4_KEY));

    /**
     * 生成sm4密钥并进行base64加密
     */
    public static String generateSm4Key() {
        return Base64.encode(generateKey("SM4").getEncoded());
    }

    /**
     * sm4加密
     *
     * @param data 明文
     */
    public static String sm4PhoneEncrypt(String data) {
        return PHONE_SM4.encryptHex(data);
    }

    /**
     * sm4解密
     *
     * @param data 密文
     * @return 明文
     */
    public static String sm4PhoneDecrypt(String data) {
        return PHONE_SM4.decryptStr(data, CharsetUtil.UTF_8);
    }
}