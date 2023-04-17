package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Admin;
import sfw.xmut.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/10 16:14
 **/
@Service
public interface UserService {
    public User findUserById(Integer userId);
    public User login(User user);
    public List<User> findUserList(Map<String, Object> queryMap);
    public int add(User user);
    public int edit(User user);
}
