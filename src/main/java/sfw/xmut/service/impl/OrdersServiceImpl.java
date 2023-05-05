package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import sfw.xmut.dao.OrdersDao;
import sfw.xmut.dao.ScreeningDao;
import sfw.xmut.pojo.Orders;
import sfw.xmut.service.OrdersService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/12 0:14
 **/
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersDao ordersDao;

    @Autowired
    private ScreeningDao screeningDao;

    @Override
    public Orders findOrderById(Integer orderId) {
        return ordersDao.findOrderById(orderId);
    }

    @Override
    public int add(Orders order) {
        return ordersDao.add(order);
    }

    @Override
    public List<Orders> findOrdersList(Map<String, Object> queryMap) {
        return ordersDao.findOrdersList(queryMap);
    }

    @Override
    public int updateStatus(Map<String, Object> queryMap) {
        return ordersDao.updateStatus(queryMap);
    }

    @Override
    public int updateQRCode(Map<String, Object> queryMap) {
        return ordersDao.updateQRCode(queryMap);
    }

    @Override
    public int updateIsComment(Map<String, Object> queryMap) {
        return ordersDao.updateIsComment(queryMap);
    }

    @Override
    public Long countPerson(Map<String, Object> queryMap) {
        return ordersDao.countPerson(queryMap);
    }

    @Override
    public Long countPrice(Map<String, Object> queryMap) {
        return ordersDao.countPrice(queryMap);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false, isolation = Isolation.DEFAULT,rollbackFor = Exception.class)
    @Override
    public void payOrderSuccess(Map<String, Object> queryMap) {
        if (screeningDao.updateSeats(queryMap) > 0) {
            System.out.println("座位信息修改成功");                     // 表示该座位已被购买
        } else {
            System.out.println("座位信息修改失败");
        }

        // 付款成功后修改订单状态
        if (ordersDao.updateStatus(queryMap) > 0) {
            System.out.println("订单状态修改成功");                     // 修改订单为已支付
        } else {
            System.out.println("订单状态修改失败");
        }
        if (ordersDao.updateQRCode(queryMap) > 0) {
            System.out.println("订单QR生成成功");                     // 更新QRCode
        } else {
            System.out.println("订单QR生成失败");
        }
    }
}
