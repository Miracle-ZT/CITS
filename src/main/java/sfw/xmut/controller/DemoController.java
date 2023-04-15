package sfw.xmut.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.util.AlipayConfig;

import javax.servlet.http.HttpServletRequest;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/9 17:25
 **/

@Controller
@RequestMapping("test")
public class DemoController {

    @RequestMapping("/demo")
    @ResponseBody
    public String demo(){
        return "login";
    }

    @RequestMapping(value = "/temp")
    public ModelAndView temp(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("demo/index_demo");
        return mv;
    }

//    @RequestMapping(value = "/form_basic")
//    public ModelAndView basic_table(HttpServletRequest request){
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("demo/form_basic");
//        mv.addObject("param_zt","===");
//        return mv;
//    }


    @RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String goAlipay() throws Exception {
        AlipayConfig alipayConfig = new AlipayConfig();
        AlipayClient alipayClient = new DefaultAlipayClient(alipayConfig.URL,alipayConfig.APPID,alipayConfig.RSA_PRIVATE_KEY,"json",alipayConfig.CHARSET,alipayConfig.ALIPAY_PUBLIC_KEY,"RSA2");
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
//异步接收地址，仅支持http/https，公网可访问
        request.setNotifyUrl("");
//同步跳转地址，仅支持http/https
        request.setReturnUrl("");
/******必传参数******/
        JSONObject bizContent = new JSONObject();
//商户订单号，商家自定义，保持唯一性
        bizContent.put("out_trade_no", "20210817010101004");
//支付金额，最小值0.01元
        bizContent.put("total_amount", 0.01);
//订单标题，不可使用特殊符号
        bizContent.put("subject", "测试商品");
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
//        System.out.println(result);
        return result;
    }
}
