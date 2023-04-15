package sfw.xmut.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sfw.xmut.pojo.Cinema;
import sfw.xmut.pojo.Message;
import sfw.xmut.pojo.Movie;
import sfw.xmut.service.CinemaService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/21 23:44
 **/
@Controller
@RequestMapping("/admin/cinema")
public class CinemaController {

    @Autowired
    CinemaService cinemaService;

    @RequestMapping(value = "/list")
    public ModelAndView index(HttpServletRequest request){
        Map<String,Object> queryMap = new HashMap<>();
//        queryMap.put()
        List<Cinema> cinemaList = cinemaService.findCinemaList(queryMap);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/cinema_list");
        mv.addObject("cinemaList",cinemaList);
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
        List<Cinema> cinemaList = cinemaService.findCinemaList(queryMap);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("cinemaList",cinemaList);
        return resultMap;
    }

    // 根据cinemaId 返回指定cinema
    @RequestMapping(value = "/findCinemaById",method = RequestMethod.POST)
    @ResponseBody
    public Map findCinemaById(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer cinemaId = Integer.valueOf(map.get("cinemaId"));
        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("cinema",cinema);
        return resultMap;
    }

    // 修改消息是否已读
    @RequestMapping(value = "/update_message_status",method = RequestMethod.POST)
    @ResponseBody
    public Map update_message_status(HttpServletRequest request, @RequestParam Map<String,String> map){
        Integer cinemaId = Integer.valueOf(map.get("cinemaId"));
        Map<String,Object> queryMap = new HashMap<>();
        queryMap.put("cinemaStatus",1);
        queryMap.put("cinemaId",cinemaId);
        if (cinemaService.updateStatus(queryMap) > 0){
            System.out.println("更新成功");
        }
        else {
            System.out.println("更新失败");
        }

        List<Cinema> cinemaList = cinemaService.findCinemaList(new HashMap<>());

        Cinema cinema = cinemaService.findCinemaById(cinemaId);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("cinema",cinema);
        resultMap.put("cinemaList",cinemaList);
        return resultMap;
    }

}
