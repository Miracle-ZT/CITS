package sfw.xmut.service;

import com.alipay.api.AlipayApiException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/9 22:25
 **/
@Service
public interface AlipayService {
    public String createPay(String out_trade_no,float total_amount,String subject) throws AlipayApiException;
    public String payNotify(@RequestParam Map<String, String> map);
//    public ModelAndView success(@RequestParam Map<String, String> map, HttpServletResponse response);
}
