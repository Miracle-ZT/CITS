package sfw.xmut.dao;

import sfw.xmut.pojo.Movie;

import java.util.List;
import java.util.Map;


/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/24 16:42
 **/
public interface MovieDao {
    public Movie findMovieById(Integer id);
    public Movie findMovieByIdDemo(Integer id);
    public List<Movie> findMovieWithList(Map<String, Object> queryMap);
    public List<Movie> findMovieList(Map<String, Object> queryMap);
    public int add(Movie movie);
    public int edit(Movie movie);
    public List<Map> findMovieListWithBO(Map<String, Object> queryMap);
}
