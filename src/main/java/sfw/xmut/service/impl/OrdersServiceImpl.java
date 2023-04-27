package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.OrdersDao;
import sfw.xmut.pojo.Orders;
import sfw.xmut.service.OrdersService;

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


}
