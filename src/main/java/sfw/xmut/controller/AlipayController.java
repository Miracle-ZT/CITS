package sfw.xmut.controller;

import com.alipay.api.AlipayApiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.service.AlipayService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/9 0:57
 **/
@Controller
@RequestMapping("/alipay")
public class AlipayController {

    @Autowired
    private AlipayService alipayService;

    @RequestMapping(value = "/pay", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String pay(HttpServletRequest request) throws AlipayApiException {
        String out_trade_no = request.getParameter("out_trade_no");
        float total_amount = Float.parseFloat(request.getParameter("total_amount"));
        return alipayService.createPay(out_trade_no,total_amount,"小蓝影视");
    }

    @ResponseBody
    @RequestMapping(value = "/notify")
    public String payNotify(@RequestParam Map<String, String> map) {
        return alipayService.payNotify(map);
    }

    //支付成功回调函数
    //http://localhost:8080/alipay/pay
//    @RequestMapping("/success")
//    public ModelAndView success(@RequestParam Map<String, String> map, HttpServletResponse response){
//        String seller_id = map.get("seller_id");
//        String trade_no = map.get("trade_no");
//        String out_trade_no = map.get("out_trade_no");
//        String total_amount = map.get("total_amount");
//        System.out.println(map);
//
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("user/ticket/pay_success");
//        modelAndView.addObject("total_amount",total_amount);
//        modelAndView.addObject("out_trade_no",out_trade_no);
//        modelAndView.addObject("trade_no",trade_no);
//        modelAndView.addObject("seller_id",seller_id);
//        return modelAndView;
//    }
}