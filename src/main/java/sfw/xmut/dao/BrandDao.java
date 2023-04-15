package sfw.xmut.dao;

import sfw.xmut.pojo.Brand;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/1 12:22
 **/
public interface BrandDao {
    public List<Brand> findBrandList(Map<String, Object> queryMap);
    public Brand findBrandById(Integer brandId);
    public int edit(Brand brand);
    public int add(Brand brand);
    public int delete(Integer brandId);
}
