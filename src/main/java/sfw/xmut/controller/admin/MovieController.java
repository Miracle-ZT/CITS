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
import sfw.xmut.pojo.*;
import sfw.xmut.service.LanguageService;
import sfw.xmut.service.MovieService;
import sfw.xmut.service.TypeService;
import sfw.xmut.util.JSONFileUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/18 15:55
 **/
//用户管理控制器
@Controller
@RequestMapping("/admin/movie")
public class MovieController {

    @Autowired
    MovieService movieService;

    @Autowired
    TypeService typeService;

    @Autowired
    LanguageService languageService;

    @RequestMapping(value = "/list")
    public ModelAndView index(HttpServletRequest request){
        Map<String,Object> queryMap = new HashMap<>();
//        queryMap.put()
        List<Movie> movieList = movieService.findMovieList(queryMap);
        List<Type> typeList = typeService.findTypeList(queryMap);
        List<Language> languageList = languageService.findLanguageList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/movie_list");
        mv.addObject("movieList",movieList);
        mv.addObject("typeList",typeList);
        mv.addObject("languageList",languageList);
        return mv;
    }

    // 根据筛选条件 刷新电影列表
    @RequestMapping(value = "/refresh_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_list(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer movieStatus = Integer.valueOf(map.get("movieStatus"));
        String keyWord = "%" + map.get("keyWord") + "%";
        Map<String,Object> queryMap = new HashMap<>();
        if (movieStatus != -1){                     // 默认为-1 全部
            queryMap.put("movieStatus",movieStatus);
        }
        if (!keyWord.equals("%%")){                     // 默认为"" 全部
            queryMap.put("keyWord",keyWord);
        }
        List<Movie> movieList = movieService.findMovieList(queryMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("movieList",movieList);
        return resultMap;
    }


    // 新增电影
    @RequestMapping("/add_movie")
    public ModelAndView add_movie(MultipartFile file, HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam("chineseName") String chineseName,
                                  @RequestParam("englishName") String englishName,
                                  @RequestParam("update-types") Integer[] typeCheckBox,
                                  @RequestParam("timeLen") Integer timeLen,
                                  @RequestParam("director") String director,
                                  @RequestParam("actors") String actors,
                                  @RequestParam("country") String country,
                                  @RequestParam("releaseDate") String releaseDate,
                                  @RequestParam("introduction") String introduction
                                  ) throws Exception{
        String upPath = request.getServletContext().getRealPath("/") + "/resources/upload/movie/";
        ObjectMapper om = new ObjectMapper();

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

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date releasedate = null;
            try {
                releasedate = sdf.parse(releaseDate);       // 将文本转换为Date
            }catch (ParseException e){
                e.printStackTrace();
            }

            // 默认未上架
            Movie movie = new Movie(chineseName,englishName,"/resources/upload/movie/" + filename,timeLen,releasedate,introduction,country,director,actors,0,new Date());
            if (movieService.add(movie) > 0){
                System.out.println("添加成功");
            }
            else {
                System.out.println("添加失败");
            }
            // 成功插入对象后Mybatis才会返回新增对象的主键并赋给此对象
            if (typeService.addRelationByList(typeCheckBox,movie.getMovieId()) > 0){
                System.out.println("添加关联成功");
            }
            else {
                System.out.println("添加关联失败");
            }
        }

        List<Movie> movieList = movieService.findMovieList(new HashMap<>());
        List<Type> typeList = typeService.findTypeList(new HashMap<>());
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/movie_list");
        mv.addObject("movieList",movieList);
        mv.addObject("typeList",typeList);
        return mv;
    }

    // 根据movieId 返回指定movie
    @RequestMapping(value = "/selectMovieById",method = RequestMethod.POST)
    @ResponseBody
    public Map selectMovieById(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer movieId = Integer.valueOf(map.get("movieId"));
        Movie movie = movieService.findMovieById(movieId);
        List<Type> typeList = typeService.findTypeList(new HashMap<>());
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("movie",movie);
        resultMap.put("typeList",typeList);
        return resultMap;
    }

    @RequestMapping("/update_movie")
    public ModelAndView update_movie(MultipartFile file, HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam("update-chineseName") String chineseName,
                                  @RequestParam("update-englishName") String englishName,
                                  @RequestParam("update-types") Integer[] typeCheckBox,
                                  @RequestParam("update-timeLen") Integer timeLen,
                                  @RequestParam("update-director") String director,
                                  @RequestParam("update-actors") String actors,
                                  @RequestParam("update-country") String country,
                                  @RequestParam("update-releaseDate") String releaseDate,
                                  @RequestParam("update-introduction") String introduction,
                                  @RequestParam("update-movieStatus") Integer movieStatus
    ) throws Exception{

        Movie movie = movieService.findMovieById(Integer.valueOf(request.getParameter("movieId")));

        String upPath = request.getServletContext().getRealPath("/") + "/resources/upload/movie/";
        ObjectMapper om = new ObjectMapper();

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
            movie.setImgUrl("/resources/upload/movie/" + filename);
        }

        // 存入其余信息至数据库
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date releasedate = null;
        try {
            releasedate = sdf.parse(releaseDate);       // 将文本转换为Date
        }catch (ParseException e){
            e.printStackTrace();
        }

        // 更新movie实体
        movie.setChineseName(chineseName);
        movie.setEnglishName(englishName);
//            movie.setTypes(types);
//            typeService.delRelationByMovieId(movie.getMovieId());               // 先删除原有的关联记录
//            typeService.addRelationByList(typeCheckBox,movie.getMovieId());     // 插入新的对应关系记录

//        System.out.println("typeCheckBox:" + Arrays.toString(typeCheckBox));
        if (typeService.delRelationByMovieId(movie.getMovieId()) > 0){
            System.out.println("删除关联成功");
        }
        else {
            System.out.println("删除关联失败");
        }

        if (typeService.addRelationByList(typeCheckBox,movie.getMovieId()) > 0){
            System.out.println("添加关联成功");
        }
        else {
            System.out.println("添加关联失败");
        }

        movie.setTimeLen(timeLen);
        movie.setDirector(director);
        movie.setActors(actors);
        movie.setCountry(country);
        movie.setReleaseDate(releasedate);
        movie.setIntroduction(introduction);
        movie.setMovieStatus(movieStatus);

        if (movieService.edit(movie) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }

        List<Movie> movieList = movieService.findMovieList(new HashMap<>());
        List<Type> typeList = typeService.findTypeList(new HashMap<>());
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/movie_list");
        mv.addObject("movieList",movieList);
        mv.addObject("typeList",typeList);
        return mv;
    }


    // 根据筛选条件 刷新类型列表
    @RequestMapping(value = "/refresh_type_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_type_list(HttpServletRequest request, @RequestParam Map<String,String> map){
        Map<String,Object> queryMap = new HashMap<>();
        List<Type> typeList = typeService.findTypeList(queryMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("typeList",typeList);
        return resultMap;
    }

    // 新增类型并刷新列表
    @RequestMapping(value = "/add_type",method = RequestMethod.POST)
    @ResponseBody
    public Map add_type(HttpServletRequest request, @RequestParam Map<String,String> map){
        String typeName = map.get("typeName");
        Type type = new Type(null,typeName);

        if (typeService.add(type) > 0){
            System.out.println("添加成功");
        }
        else {
            System.out.println("添加失败");
        }

        List<Type> typeList = typeService.findTypeList(new HashMap<>());
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("typeList",typeList);
        return resultMap;
    }

    // 修改类型并刷新列表
    @RequestMapping(value = "/edit_type",method = RequestMethod.POST)
    @ResponseBody
    public Map edit_type(HttpServletRequest request, @RequestParam Map<String,String> map){
        String typeName = map.get("typeName");
        Integer typeId = Integer.valueOf(map.get("typeId"));
        Type type = typeService.findTypeById(typeId);
        type.setTypeName(typeName);

        if (typeService.edit(type) > 0){
            System.out.println("修改成功");
        }
        else {
            System.out.println("修改失败");
        }

        List<Type> typeList = typeService.findTypeList(new HashMap<>());
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("typeList",typeList);
        return resultMap;
    }

}
