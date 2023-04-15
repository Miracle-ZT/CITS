package sfw.xmut.controller.admin;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.Brand;
import sfw.xmut.pojo.Movie;
import sfw.xmut.pojo.Resource;
import sfw.xmut.service.BrandService;
import sfw.xmut.util.JSONFileUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/16 13:06
 **/
@Controller
@RequestMapping("/admin/brand")
public class BrandController {

    @Autowired
    BrandService brandService;

    @RequestMapping(value = "/list")
    public ModelAndView index(HttpServletRequest request){
        Map<String,Object> queryMap = new HashMap<>();
        List<Brand> brandList = brandService.findBrandList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/brand_list");
        mv.addObject("brandList",brandList);
        return mv;
    }

    // 根据brandId 返回指定brand  --- 查看
    @RequestMapping(value = "/findBrandById",method = RequestMethod.POST)
    @ResponseBody
    public Map findBrandById(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer brandId = Integer.valueOf(map.get("brandId"));
        System.out.println("brandId=" + brandId);
        Brand brand = brandService.findBrandById(brandId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("brand",brand);
        return resultMap;
    }

    // 更新brand
    @RequestMapping("/update_brand")
    public ModelAndView update_brand(HttpServletRequest request,
                                      @RequestParam("newBrandName") String newBrandName){
        Integer brandId = Integer.valueOf(request.getParameter("brandId"));
        Brand brand = brandService.findBrandById(brandId);

        brand.setBrandName(newBrandName);

        System.out.println(brand);

        if (brandService.edit(brand) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }
        Map<String,Object> queryMap = new HashMap<>();
        List<Brand> brandList = brandService.findBrandList(queryMap);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/brand_list");
        mv.addObject("brandList",brandList);
        return mv;
    }

    // 新增品牌
    @RequestMapping("/add_brand")
    public ModelAndView add_brand(HttpServletRequest request, @RequestParam("brandName") String brandName){
        Brand brand = new Brand();
        brand.setBrandName(brandName);
        if (brandService.add(brand) > 0){
            System.out.println("添加成功");
        }
        else {
            System.out.println("添加失败");
        }
        Map<String,Object> queryMap = new HashMap<>();
        List<Brand> brandList = brandService.findBrandList(queryMap);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/brand_list");
        mv.addObject("brandList",brandList);
        return mv;
    }

    // 根据筛选条件 刷新品牌列表
    @RequestMapping(value = "/refresh_brand_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_list(HttpServletRequest request, @RequestParam Map<String,String> map){
        String keyWord = "%" + map.get("keyWord") + "%";
        Map<String,Object> queryMap = new HashMap<>();

        if (!keyWord.equals("%%")){                     // 默认为"%%" 全部
            queryMap.put("keyWord",keyWord);
        }
        List<Brand> brandList = brandService.findBrandList(queryMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("brandList",brandList);
        return resultMap;
    }

    // 删除轮播图
    @RequestMapping(value = "/delete_brand",method = RequestMethod.POST)
    @ResponseBody
    public Map delete_brand(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer brandId = Integer.valueOf(map.get("brandId"));

        if (brandService.delete(brandId) > 0){
            System.out.println("删除成功");
        }
        else {
            System.out.println("删除失败");
        }

        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }
}
