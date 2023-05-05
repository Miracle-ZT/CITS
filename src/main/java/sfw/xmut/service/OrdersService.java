package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Orders;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/12 0:13
 **/
@Service
public interface OrdersService {
    public Orders findOrderById(Integer orderId);
    public int add(Orders order);
    public List<Orders> findOrdersList(Map<String, Object> queryMap);
    public int updateStatus(Map<String, Object> queryMap);
    public int updateQRCode(Map<String, Object> queryMap);
    public int updateIsComment(Map<String, Object> queryMap);
    public Long countPerson(Map<String, Object> queryMap);
    public Long countPrice(Map<String, Object> queryMap);
    public void payOrderSuccess(Map<String, Object> queryMap);
}
