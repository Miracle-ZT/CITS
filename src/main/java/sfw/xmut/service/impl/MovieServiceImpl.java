package sfw.xmut.service.impl;

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
    public List<Movie> findMovieList(Map<String, Object> queryMap) {
        return movieDao.findMovieList(queryMap);
    }

    @Override
    public int add(Movie movie) {
        return movieDao.add(movie);
    }

    @Override
    public int edit(Movie movie) {
        return movieDao.edit(movie);
    }


}
