package sfw.xmut.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Movie;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/25 14:03
 **/
@Service
public interface MovieService {
    public Movie findMovieById(Integer id);
    public Movie findMovieByIdDemo(Integer id);
    public List<Movie> findMovieWithList(Map<String, Object> queryMap);
    public PageInfo<Movie> findMovieList(Map<String, Object> queryMap);
    public int add(Movie movie);
    public int edit(Movie movie);
    public List<Map> findMovieListWithBO(Map<String, Object> queryMap);
}
