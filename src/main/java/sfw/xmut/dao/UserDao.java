package sfw.xmut.dao;

import sfw.xmut.pojo.Admin;
import sfw.xmut.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/16 16:06
 **/
public interface UserDao {
    public User findUserById(Integer userId);
    public User findUserByEmailAndPassword(User user);
    public List<User> findUserList(Map<String, Object> queryMap);
    public int add(User user);
    public int edit(User user);
}
