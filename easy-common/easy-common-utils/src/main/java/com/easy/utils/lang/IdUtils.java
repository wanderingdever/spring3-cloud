package com.easy.utils.lang;

import com.github.f4b6a3.ulid.UlidCreator;
import org.dromara.hutool.core.data.id.IdUtil;

import java.security.SecureRandom;
import java.util.Random;

/**
 * ID生成器工具类
 * </p>
 *
 * @author Matt
 */
public class IdUtils extends IdUtil {
    /**
     * 自定义进制(0,1没有加入,容易与o,l混淆)
     */
    private static final char[] CUSTOM_BASE =
            new char[]{'a', 'd', 'f', 'h', 'j', '2', 'l', 'm', 'n', 'p', 'i', 'r', 's', 't', '7', 'u', 'v', 'b', 'w', 'x',
                    'r', 'y', 'z', 'Q', 'W', 'e', 'E', '8', 'A', 'S', 'D', 'Z', 'X', '9', 'C', 'P', '5', 'I', 'K', '3', 'M',
                    'J', 'U', 'g', 'F', 'k', 'R', '4', 'V', 'Y', 'c', 'l', 'T', 'N', '6', 'q', 'B', 'G', 'H'};
    /**
     * 不能与自定义进制有重复
     */
    private static final char SPECIAL = 'O';
    /**
     * 进制长度
     */
    private static final int BIN_LEN = CUSTOM_BASE.length;
    /**
     * 序列最小长度
     */
    private static final int SMALLEST = 4;

    private static final String[] CHARS = new String[]{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
            "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
            "W", "X", "Y", "Z"};

    private IdUtils() {
        throw new IllegalAccessError("IdUtils.class");
    }


    /**
     * 生成随机码
     *
     * @return 随机码
     */
    public static String generateCode(int max) {
        return generateCode(max, generateRandomCode());
    }

    /**
     * 生成随机码
     *
     * @return 随机码
     */
    private static String generateCode(int max, String code) {
        // 生成id
        long id = codeToId(code);
        char[] buf = new char[32];
        int charPos = 32;
        while ((id / BIN_LEN) > 0) {
            int ind = (int) (id % BIN_LEN);
            buf[--charPos] = CUSTOM_BASE[ind];
            id /= BIN_LEN;
        }
        buf[--charPos] = CUSTOM_BASE[(int) (id % BIN_LEN)];
        String str = new String(buf, charPos, (32 - charPos));
        // 不够长度的自动随机补全
        if (str.length() < max) {
            StringBuilder sb = new StringBuilder();
            sb.append(SPECIAL);
            Random rnd = new Random();
            for (int i = 1; i < max - str.length(); i++) {
                sb.append(CUSTOM_BASE[rnd.nextInt(BIN_LEN)]);
            }
            str += sb.toString();
        }
        return str;
    }

    private static long codeToId(String code) {
        char[] chs = code.toCharArray();
        long res = 0L;
        for (int i = 0; i < chs.length; i++) {
            int ind = 0;
            for (int j = 0; j < BIN_LEN; j++) {
                if (chs[i] == CUSTOM_BASE[j]) {
                    ind = j;
                    break;
                }
            }
            if (chs[i] == SPECIAL) {
                break;
            }
            if (i > 0) {
                res = res * BIN_LEN + ind;
            } else {
                res = ind;
            }
        }
        return res;
    }

    /**
     * 自定义长度 数字随机码
     *
     * @param length 随机码长度
     * @return 随机码
     */
    public static String generateRandomCodeNum(int length) {
        SecureRandom secureRandom = new SecureRandom();
        int min = (int) Math.pow(10, length - 1);
        int max = (int) Math.pow(10, length) - 1;
        int randomNumber = secureRandom.nextInt(max - min + 1) + min;
        return String.valueOf(randomNumber);
    }

    /**
     * 生成8位数随机码
     *
     * @return 8位随机密码
     */
    public static String generateRandomCode() {
        StringBuilder shortBuffer = new StringBuilder();
        String uuid = fastSimpleUUID();
        for (int i = 0; i < SMALLEST; i++) {
            String str = uuid.substring(i * 2, i * 2 + 2);
            int x = Integer.parseInt(str, 16);
            shortBuffer.append(CHARS[x % 0x3E]);
        }
        return shortBuffer.toString();
    }

    /**
     * 产生范围内的随机数
     *
     * @param min 最小数
     * @param max 最大数
     * @return 随机数
     */
    public static int randomRange(int min, int max) {
        return new Random().nextInt(max - min) + min;
    }


    public static void main(String[] args) {
        System.out.println(fastSimpleUUID());
        System.out.println(UlidCreator.getMonotonicUlid());
    }
}