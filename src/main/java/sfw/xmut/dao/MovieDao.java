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
    public List<Movie> findCollectMovieListByUserId(Integer userId);

    // 平均评分(口碑) + 累计票房
    public Long findBOWithMovieId(Integer movieId);
    public Double findAvgScoreWithMovieId(Integer movieId);

    public List<Map> findMovieListWithAvgScore();

    // 收藏模块部分
    public boolean isCollectExist(Map<String, Object> queryMap);
    public int addCollect(Map<String, Object> queryMap);
    public Integer checkCollectStatus(Map<String, Object> queryMap);
    public int updateCollectStatus(Map<String, Object> queryMap);
}
