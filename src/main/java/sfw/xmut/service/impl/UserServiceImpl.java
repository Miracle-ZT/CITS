package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.AdminDao;
import sfw.xmut.dao.UserDao;
import sfw.xmut.pojo.Admin;
import sfw.xmut.pojo.User;
import sfw.xmut.service.AdminService;
import sfw.xmut.service.UserService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/10 16:15
 **/

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findUserById(Integer userId) {
        return userDao.findUserById(userId);
    }

    @Override
    public User login(User user) {
        return userDao.findUserByEmailAndPassword(user);
    }

    @Override
    public List<User> findUserList(Map<String, Object> queryMap) {
        return userDao.findUserList(queryMap);
    }

    @Override
    public int edit(User user) {
        return userDao.edit(user);
    }

}
