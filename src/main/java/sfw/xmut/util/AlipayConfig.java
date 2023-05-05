package sfw.xmut.util;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/9 1:41
 **/
public class AlipayConfig {
    /**
     * 沙箱appId
     */
    public static final String APPID = "2021000122610816";
    /**
     * 请求网关  固定
     */
    public static final String URL = "https://openapi.alipaydev.com/gateway.do";

    /**
     * 设置内网穿透回调地址
     */
    public static final String CALLBACK = "fyrnr4.natappfree.cc";
    /**
     * 编码
     */
    public static final String CHARSET = "UTF-8";

    /**
     * 返回格式
     */
    public static final String FORMAT = "json";

    /**
     * RSA2
     */
    public static final String SIGNTYPE = "RSA2";

    /**
     * 异步通知地址
     */
//    public static final String NOTIFY_URL = "http://"+CALLBACK+"/alipay/notify";
    public static final String NOTIFY_URL = "http://"+CALLBACK+"/alipay/notify";
    /**
     * 同步地址
     */
    //使用内网穿透进行回调
//    public static final String RETURN_URL = "http://"+CALLBACK+"/alipay/success";
    public static final String RETURN_URL = "http://"+CALLBACK+"/home/order/success";

    /**
     * 应用私钥 pkcs8格式
     */
    public static final String RSA_PRIVATE_KEY =
            "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCDCNNjGB7ESWGxzZwVhmWjDCUN/JR8g4e5/SxFJAAQMHNUWU+E1lm0opQTvPj2xMWIVlb1AHaRmmWhWzkx1qwq51ppIgpnZybgb2++nGzt2qVgPtP9lE8RbxHveVGHF+yOOXo7qNW4GBboFVYUFXacgNV7ywUpLaEPRDlBm6z/j5LwtSP5E/+wd9KVKaQDWP8BkJxpyl1qD8H/MqlQz9R5GAdO6PBwDbdEWwBLWuCOGlA2V1JEYJGPWE3IP2faoE2z4QDNw97y8+HJBCgRwIKjbfZuR1Kq94duwF77c40J8PZzRBEFxdeWR9ZSL6bfNk1Mhh4cW3Yn94/4uQQPmNoXAgMBAAECggEADtFJrjQFDqdJr+STWO/IwIZYDlvYorfw+jxB7FOk2i/QauJqlpfyrvWPjyfYc3dO6xrwXGZAAjkWcwew0Qz4jSV6WNcrnAPTJqATX9eqjb8i4l5YdJ13z33i5lSuvnsbGf4v710pRdcbiAUZpc3DivEasxQDMmPhiatqWhvzlTaKNi8UMCGm7fN/HiO3GGhGVNawZF+Z8xNJiY64oSpSPQNK7W9RmelTFCAIqQWNpHXsGqXEDkhzyEItPWcC4XtVSMnxhBO0bvDpUUQ/nsn+d6zBQc4isuXeAMnaIXEkOLiT7QkYxsM62lyyN4KJrbWcT5HOBOczChnZin3SgIRDiQKBgQDWJMttM3IaEj/XGu/J7ftEK1XiIBDikRCmp+F348RMKpr51tVmvNrWXzRMmfJN2V7aHodhcw5OJc3rH1TVPy3J1dBiP4CEOjkBH2DuCEiKKliTU1I8I6qUYBP2mo+hfOFSyOGLDHnXVS0slig8uuCdjZiM2L7CmQXi9j8G9zEKDQKBgQCcpXTOh842vUIiuyxNhdN/LT4+PbQmKKUikOROaWKaHo8EZMIVa2LKUqY+NaH2BHBGk4z4ufPauL/pA1eDJjwVQXj2x0lQD1pATocLF2cjoQICvq3F+PZ9uc5DTazEJFU4u6fbrjMbzKPQc0oTmkFf10/A6MpVw1mYIj5m2uRfswKBgBgtKUZX447r9ocrhFzw4EhO+DBCXIWnyRB3ra3iahwLR1njlk42DiLbtsTbMI73doz7m182JSxPelMMQ4Cb1GiQGimtb63+AMeOqlvVVZM7uqpPYt5lTHHZ8wcJZiPePHYjNcuEChF0jVgWT86jbo57GPj103uW2SJJmM4JhGDVAoGBAIZZvkoY3jvCrQN+x2uh+RidpEHbyDPmLmPsI3RBHMmUphMdm/ylArEGnADFHSkU+3r8uC7nxgd051wheqBIXcXZRrdZiz54PG7lKxvPMa20PTY/dmlSs453mznMV/5OLy2efUSELt+L74AsMX+IkMNztrp8rnVKPACodh7fZHnTAoGAI0bsNjpks7i9pZf6JOZb9Tfvdfy2WfUvWQ0H8M/r45yxypEqmGZQR9tbLfYlI6Wq4q23M7CR4JxRPcYRnIjVLPHaLi/D3E+5Q03wePAnlgtrd5CdWQ9E59y5A6gxEanTecJAXuvmFnbq5IN6Ilyqy/L+N/j2toA3+1yTtnuXxw4=";

    /**
     * 沙箱支付宝公钥
     */
    public static final String ALIPAY_PUBLIC_KEY =
            "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5LCBHaJSuFDvQ5PBwPk6xnFzVHm5NtVV/zeAQwaQgGAu+FyDa80q07tNz43iKkKNoXMCue06p7HFfKRX7Qm32Z8JVvmMCoiNFPa2cJxFed3eEYVqsrdNkmaWD/92Hosul+WmtaAPwNB7Ql55Rh/zqdaNaMCwPpc+19b9A+7T02BA4P6wkHm/zoDNxhzduq5pvD75ihMulpv9pZyMKFvFUrtInGj/olZcuBJcsE4YC3Nbh1n0mWlDZaN+AKkC7QfGP4Pj4KioNrhwtpw56NhvQZPCKNniknbnRQYTHhtgBZ0qcDrP7Ucu+cpy1ZOgXyuy1k4S2tzvMP3hata0fP2+zwIDAQAB";

    public AlipayConfig() {
    }
}