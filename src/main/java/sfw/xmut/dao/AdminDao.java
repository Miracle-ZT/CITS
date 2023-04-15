package sfw.xmut.dao;
import org.springframework.stereotype.Repository;
import sfw.xmut.pojo.Admin;

import java.util.List;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/10 16:00
 **/
@Repository
public interface AdminDao {
    public List<Admin> findAll();
    public Admin findAdminByEmailAndPassword(Admin admin);
}
