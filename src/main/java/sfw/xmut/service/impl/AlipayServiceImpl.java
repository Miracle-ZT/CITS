package sfw.xmut.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.service.AlipayService;
import sfw.xmut.util.AlipayConfig;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/9 22:27
 **/
@Service
public class AlipayServiceImpl implements AlipayService {

    @Override
    public String createPay(String out_trade_no, float total_amount, String subject) throws AlipayApiException {
        AlipayClient alipayClient = new DefaultAlipayClient(
                AlipayConfig.URL,AlipayConfig.APPID,AlipayConfig.RSA_PRIVATE_KEY,AlipayConfig.FORMAT,
                AlipayConfig.CHARSET,AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        //异步接收地址，仅支持http/https，公网可访问
        request.setNotifyUrl("");
        //同步跳转地址，仅支持http/https
        request.setReturnUrl(AlipayConfig.RETURN_URL);
        // System.out.println("RETURN_URL=" + alipayConfig.RETURN_URL);

        /******必传参数******/
        JSONObject bizContent = new JSONObject();
        //商户订单号，商家自定义，保持唯一性
        bizContent.put("out_trade_no", out_trade_no);
        //支付金额，最小值0.01元
        bizContent.put("total_amount", total_amount);
        //订单标题，不可使用特殊符号
        bizContent.put("subject", subject);
        //电脑网站支付场景固定传值FAST_INSTANT_TRADE_PAY
        bizContent.put("product_code", "FAST_INSTANT_TRADE_PAY");

        request.setBizContent(bizContent.toString());
        AlipayTradePagePayResponse response = alipayClient.pageExecute(request);
        if(response.isSuccess()){
            System.out.println("调用成功");
        } else {
            System.out.println("调用失败");
        }
        String result = alipayClient.pageExecute(request).getBody();
        return result;
    }

    @Override
    public String payNotify(@RequestParam Map<String, String> map){
        return "";
    }
}
