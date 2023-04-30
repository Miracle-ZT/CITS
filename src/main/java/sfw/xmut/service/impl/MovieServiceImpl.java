package sfw.xmut.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.MovieDao;
import sfw.xmut.pojo.Movie;
import sfw.xmut.service.MovieService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/25 14:04
 **/
@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieDao movieDao;

    @Override
    public Movie findMovieById(Integer id) {
        return movieDao.findMovieById(id);
    }

    @Override
    public Movie findMovieByIdDemo(Integer id) {
        return movieDao.findMovieByIdDemo(id);
    }

    @Override
    public List<Movie> findMovieWithList(Map<String, Object> queryMap) {
        return movieDao.findMovieWithList(queryMap);
    }

    @Override
    public PageInfo<Movie> findMovieList(Map<String, Object> queryMap) {
        // queryMap中的currPage和pageSize只会在Service层获取并使用 不涉及Dao层
        Integer currPage = (queryMap.get("currPage") != null) ? (Integer)queryMap.get("currPage") : 1;
        // 默认一页包含7个元素 --- 一排 用户首页中
        Integer pageSize = (queryMap.get("pageSize") != null) ? (Integer)queryMap.get("pageSize") : 7;
        PageHelper.startPage(currPage,pageSize);
        List<Movie> movieList = movieDao.findMovieList(queryMap);
        PageInfo<Movie> moviePageInfo = new PageInfo<>(movieList,3);

//        System.out.println("当前页:"+moviePageInfo.getPageNum());
//        System.out.println("每页查多少:"+moviePageInfo.getPageSize());
//        System.out.println("总条数:"+moviePageInfo.getTotal());
//        System.out.println("总页数:"+moviePageInfo.getPages());
//        System.out.println("每页显示的数据:"+moviePageInfo.getList().size());
//        System.out.println("上一页页码:"+moviePageInfo.getPrePage());
//        System.out.println("下一页页码:"+moviePageInfo.getNextPage());
//        System.out.println("页面显示的第一个页码:"+moviePageInfo.getNavigateFirstPage());
//        System.out.println("页面显示的最后一个页码:"+moviePageInfo.getNavigateLastPage());

        return moviePageInfo;
    }

    @Override
    public int add(Movie movie) {
        return movieDao.add(movie);
    }

    @Override
    public int edit(Movie movie) {
        return movieDao.edit(movie);
    }

    @Override
    public List<Map> findMovieListWithBO(Map<String, Object> queryMap) {
        return movieDao.findMovieListWithBO(queryMap);
    }

    @Override
    public Long findBOWithMovieId(Integer movieId) {
        return movieDao.findBOWithMovieId(movieId);
    }

    @Override
    public Double findAvgScoreWithMovieId(Integer movieId) {
        return movieDao.findAvgScoreWithMovieId(movieId);
    }

    @Override
    public List<Map> findMovieListWithAvgScore() {
        return movieDao.findMovieListWithAvgScore();
    }


}
