package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Banner;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/24 19:55
 **/
@Service
public interface BannerService {
    public Banner findBannerById(Integer banId);
    public List<Banner> findAll();
    public List<Banner> findBannerList(Map<String, Object> queryMap);
    public int edit(Banner banner);
    public int add(Banner banner);
    public int delete(Integer banId);
}
