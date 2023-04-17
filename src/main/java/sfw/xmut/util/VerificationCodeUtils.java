package sfw.xmut.util;

import java.util.Random;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/4/16 22:36
 **/
public class VerificationCodeUtils {
    public static String VerificationCode(int len) {
        StringBuffer result = new StringBuffer();
        try {
            for (int i = 0; i < len; i++) {
                result.append(new Random().nextInt(len) + "");   // [0,len)
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }
}
