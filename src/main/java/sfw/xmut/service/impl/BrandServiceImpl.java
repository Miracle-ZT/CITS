package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.BrandDao;
import sfw.xmut.pojo.Brand;
import sfw.xmut.service.BrandService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/1 12:25
 **/
@Service
public class BrandServiceImpl implements BrandService {

    @Autowired
    private BrandDao brandDao;

    @Override
    public List<Brand> findBrandList(Map<String, Object> queryMap) {
        return brandDao.findBrandList(queryMap);
    }

    @Override
    public Brand findBrandById(Integer brandId) {
        return brandDao.findBrandById(brandId);
    }

    @Override
    public int edit(Brand brand) {
        return brandDao.edit(brand);
    }

    @Override
    public int add(Brand brand) {
        return brandDao.add(brand);
    }

    @Override
    public int delete(Integer brandId) {
        return brandDao.delete(brandId);
    }
}
