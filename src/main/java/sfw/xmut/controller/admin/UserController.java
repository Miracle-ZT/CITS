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
import sfw.xmut.pojo.Cinema;
import sfw.xmut.pojo.Movie;
import sfw.xmut.pojo.Resource;
import sfw.xmut.pojo.User;
import sfw.xmut.service.UserService;
import sfw.xmut.util.JSONFileUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/22 11:55
 **/
@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/list")
    public ModelAndView index(HttpServletRequest request){
        Map<String,Object> queryMap = new HashMap<>();
        List<User> userList = userService.findUserList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/user_list");
        mv.addObject("userList",userList);
        return mv;
    }

    // 根据userId 返回指定user
    @RequestMapping(value = "/selectUserById",method = RequestMethod.POST)
    @ResponseBody
    public Map selectUserById(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer userId = Integer.valueOf(map.get("userId"));
        User user = userService.findUserById(userId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("user",user);
        return resultMap;
    }


    @RequestMapping("/update_user")
    public ModelAndView update_user(MultipartFile file, HttpServletRequest request,
                                     @RequestParam("update-username") String username,
                                     @RequestParam("update-password") String password,
                                     @RequestParam("update-email") String email,
                                     @RequestParam("update-phone") String phone
    ) throws Exception{

        String upPath = request.getServletContext().getRealPath("/") + "/resources/upload/head/";
        ObjectMapper om = new ObjectMapper();

        // 放在外部 使得内外都可用 图片文件不必每次强制更新
        User user = userService.findUserById(Integer.valueOf(request.getParameter("userId")));

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
            user.setPhoto("/resources/upload/head/" + filename);
        }
        // 上为文件部分
        // 更新user实体
        // 下为其余文本信息部分
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);

        System.out.println(user);

        if (userService.edit(user) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }

        List<User> userList = userService.findUserList(new HashMap<>());
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/user_list");
        mv.addObject("userList",userList);
        return mv;
    }

    // 根据筛选条件 刷新影院列表
    @RequestMapping(value = "/refresh_list",method = RequestMethod.POST)
    @ResponseBody
    public Map refresh_list(HttpServletRequest request, @RequestParam Map<String,String> map){
        String keyWord = "%" + map.get("keyWord") + "%";
        Map<String,Object> queryMap = new HashMap<>();

        if (!keyWord.equals("%%")){                     // 默认为"" 全部
            queryMap.put("keyWord",keyWord);
        }
        List<User> userList = userService.findUserList(queryMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("userList",userList);
        return resultMap;
    }

}
