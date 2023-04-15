package sfw.xmut.util;

import java.util.Random;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/12 16:14
 **/
public class OrderNumProducer {

    // 原生成方法 时间戳 + 6位随机数/符 + 用户ID hash(暂未实现)
    // 新生成方法 XL + 时间戳(4bit) + 16进制随机数(16bit)
    public String OrderNum(){
//        // 6位随机数
//        int randomNumWith6 = (int)(Math.floor(Math.random()*(Math.pow(10, 6))));
//
//        // 时间戳
//        String currentTime = String.valueOf(System.currentTimeMillis());
//
//        String resultString = randomNumWith6 + currentTime;
//        return resultString;

        int len = 16;        // 生成长度 -- hex
        StringBuffer result = new StringBuffer();
        String currentTime = String.valueOf(System.currentTimeMillis());
        currentTime = currentTime.substring(currentTime.length()-4,currentTime.length());   // 生成长度 -- timestamp
        try {
            for(int i=0;i<len;i++) {
                result.append(Integer.toHexString(new Random().nextInt(16)));   // [0,16)
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return "XL" + result.toString().toUpperCase() + currentTime;
    }
}
