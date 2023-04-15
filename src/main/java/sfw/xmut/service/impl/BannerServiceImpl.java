package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.BannerDao;
import sfw.xmut.pojo.Banner;
import sfw.xmut.service.BannerService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/24 19:57
 **/
@Service
public class BannerServiceImpl implements BannerService {

    @Autowired
    private BannerDao bannerDao;

    @Override
    public Banner findBannerById(Integer banId) {
        return bannerDao.findBannerById(banId);
    }

    @Override
    public List<Banner> findAll() {
        return bannerDao.findAll();
    }

    @Override
    public List<Banner> findBannerList(Map<String, Object> queryMap) {
        return bannerDao.findBannerList(queryMap);
    }

    @Override
    public int edit(Banner banner) {
        return bannerDao.edit(banner);
    }

    @Override
    public int add(Banner banner) {
        return bannerDao.add(banner);
    }

    @Override
    public int delete(Integer banId) {
        return bannerDao.delete(banId);
    }
}
