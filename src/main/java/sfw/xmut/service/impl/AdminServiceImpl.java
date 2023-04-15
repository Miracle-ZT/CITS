package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.AdminDao;
import sfw.xmut.pojo.Admin;
import sfw.xmut.service.AdminService;

import java.util.List;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/10 16:15
 **/

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin login(Admin admin) {
        return adminDao.findAdminByEmailAndPassword(admin);
    }

    @Override
    public List<Admin> findAll() {
        return adminDao.findAll();
    }
}
