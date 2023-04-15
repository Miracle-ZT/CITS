package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Admin;

import java.util.List;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/10 16:14
 **/
@Service
public interface AdminService {
    public Admin login(Admin admin);
    public List<Admin> findAll();
}
