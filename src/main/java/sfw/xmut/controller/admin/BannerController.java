package sfw.xmut.controller.admin;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.Banner;
import sfw.xmut.pojo.Movie;
import sfw.xmut.pojo.Resource;
import sfw.xmut.pojo.User;
import sfw.xmut.service.BannerService;
import sfw.xmut.service.MovieService;
import sfw.xmut.util.JSONFileUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/22 20:42
 **/
@Controller
@RequestMapping("/admin/banner")
public class BannerController {

    @Autowired
    BannerService bannerService;

    @Autowired
    MovieService movieService;

    @RequestMapping(value = "/list")
    public ModelAndView index(HttpServletRequest request){
//        Map<String,Object> queryMap = new HashMap<>();
        List<Banner> bannerList = bannerService.findAll();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/banner_list");
        mv.addObject("bannerList",bannerList);
        return mv;
    }

    // 根据banId 返回指定ban  --- 查看
    @RequestMapping(value = "/selectBannerById",method = RequestMethod.POST)
    @ResponseBody
    public Map selectBannerById(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer banId = Integer.valueOf(map.get("banId"));
        Banner banner = bannerService.findBannerById(banId);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("banner",banner);
        return resultMap;
    }

    // 更新banner
    @RequestMapping("/update_banner")
    public ModelAndView update_banner(MultipartFile file, HttpServletRequest request,
                                    @RequestParam("movie-edit") Integer movieId
    ) throws Exception{

        // 图片存储位置
        String upPath = request.getServletContext().getRealPath("/") + "/resources/upload/banner/";
        ObjectMapper om = new ObjectMapper();

        // 放在外部 使得内外都可用 图片文件不必每次强制更新
        Banner banner = bannerService.findBannerById(Integer.valueOf(request.getParameter("banId")));

        if (!file.isEmpty()){

            // 对象化的现有文件列表
            List<Resource> fileList = new ArrayList<>();

            String filename = file.getOriginalFilename();

            // json记录文件的路径
            String jsonFilePath = request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json";
            String fileNamesJson = JSONFileUtils.readFile(jsonFilePath);
            if (fileNamesJson.length() > 0){
                // 已存在文件 需判断名字是否重复
                fileList = om.readValue(fileNamesJson,new TypeReference<List<Resource>>(){});
            }

            for (Resource resource:fileList){
                if (resource.getName().equals(filename)){       // 文件重名
                    String[] temp = filename.split("\\.");
                    filename = temp[0] + "(1)." + temp[1];
                }
            }

            // 保存 --- 实现上传
            file.transferTo(new File(upPath + filename));   // 上传
            fileList.add(new Resource(filename));
            fileNamesJson = om.writeValueAsString(fileList);        // 更新用于记录文件列表的json文件
            JSONFileUtils.writeFile(fileNamesJson,request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json");

            // 文件上传成功 存入其余信息数据库
            // 只有当存在图片文件时 才更新文件路径
            banner.setPath("/resources/upload/banner/" + filename);
        }
        // 上为文件部分
        // 更新banner实体
        // 下为其余文本信息部分
        banner.setMovieId(movieId);

        System.out.println(banner);

        if (bannerService.edit(banner) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }

        List<Banner> bannerList = bannerService.findAll();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/banner_list");
        mv.addObject("bannerList",bannerList);
        return mv;
    }

    // 返回当前不存在Banner的电影的列表   --- 编辑+新增
    @RequestMapping(value = "/selectMovieNotInBanList",method = RequestMethod.POST)
    @ResponseBody
    public Map selectMovieNotInBanList(HttpServletRequest request, @RequestParam Map<String,String> map){
        Map<String, Object> resultMap = new HashMap<>();

        if (request.getParameter("banId") != null){     // 有banId说明是编辑操作 无banId说明是新增操作
            Integer banId = Integer.valueOf(request.getParameter("banId"));
            Banner banner = bannerService.findBannerById(banId);
            resultMap.put("banner",banner);
        }
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("NotInBan","NotInBan");        // 排除已存在banner电影的List
        queryMap.put("pageSize",Integer.MAX_VALUE);
        PageInfo<Movie> moviePageInfo = movieService.findMovieList(queryMap);    // 用于绑定所属电影的选择下拉框
        resultMap.put("movieList",moviePageInfo.getList());
        return resultMap;
    }

    // 新增轮播
    @RequestMapping("/add_banner")
    public ModelAndView add_banner(MultipartFile file, HttpServletRequest request,
                                    @RequestParam("movie-add") Integer movieId
    ) throws Exception{

        String upPath = request.getServletContext().getRealPath("/") + "/resources/upload/banner/";
        ObjectMapper om = new ObjectMapper();

        Banner banner = new Banner();

        if (!file.isEmpty()){
            // 对象化的现有文件列表
            List<Resource> fileList = new ArrayList<>();

            String filename = file.getOriginalFilename();

            // json记录文件的路径
            String jsonFilePath = request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json";
            String fileNamesJson = JSONFileUtils.readFile(jsonFilePath);
            if (fileNamesJson.length() > 0){
                // 已存在文件 需判断名字是否重复
                fileList = om.readValue(fileNamesJson,new TypeReference<List<Resource>>(){});
            }

            for (Resource resource:fileList){
                if (resource.getName().equals(filename)){       // 文件重名
                    String[] temp = filename.split("\\.");
                    filename = temp[0] + "(1)." + temp[1];
                }
            }

            // 保存 --- 实现上传
            file.transferTo(new File(upPath + filename));   // 上传
            fileList.add(new Resource(filename));
            fileNamesJson = om.writeValueAsString(fileList);        // 更新用于记录文件列表的json文件
            JSONFileUtils.writeFile(fileNamesJson,request.getServletContext().getRealPath("/") + "/WEB-INF/views/utils/fileList.json");

            banner.setPath("/resources/upload/banner/" + filename);

        }
        // 上为文件部分
        // 下为其余文本信息部分
        banner.setMovieId(movieId);
        banner.setBanAddDate(new Date());

        System.out.println(banner);

        if (bannerService.add(banner) > 0){
            System.out.println("添加成功");
        }
        else {
            System.out.println("添加失败");
        }

        List<Banner> bannerList = bannerService.findAll();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/banner_list");
        mv.addObject("bannerList",bannerList);
        return mv;
    }

    // 根据筛选条件 刷新轮播列表
    @RequestMapping(value = "/refresh_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_list(HttpServletRequest request, @RequestParam Map<String,String> map){
        String keyWord = "%" + map.get("keyWord") + "%";
        Map<String,Object> queryMap = new HashMap<>();

        if (!keyWord.equals("%%")){                     // 默认为"%%" 全部
            queryMap.put("keyWord",keyWord);
        }
        List<Banner> bannerList = bannerService.findBannerList(queryMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("bannerList",bannerList);
        return resultMap;
    }

    // 删除轮播图
    @RequestMapping(value = "/delete_banner",method = RequestMethod.POST)
    @ResponseBody
    public Map delete_banner(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer banId = Integer.valueOf(map.get("banId"));

        if (bannerService.delete(banId) > 0){
            System.out.println("删除成功");
        }
        else {
            System.out.println("删除失败");
        }

        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }
}
