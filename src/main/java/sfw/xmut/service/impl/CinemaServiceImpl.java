package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.CinemaDao;
import sfw.xmut.pojo.Cinema;
import sfw.xmut.service.CinemaService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/28 18:33
 **/
@Service
public class CinemaServiceImpl implements CinemaService {

    @Autowired
    private CinemaDao cinemaDao;

    @Override
    public List<Cinema> findCinemaListWithScreening(Map<String, Object> queryMap) {
        return cinemaDao.findCinemaListWithScreening(queryMap);
    }

    @Override
    public List<Cinema> findCinemaList(Map<String, Object> queryMap) {
        return cinemaDao.findCinemaList(queryMap);
    }

    @Override
    public Cinema findCinemaById(Integer cinemaId) {
        return cinemaDao.findCinemaById(cinemaId);
    }

    @Override
    public int edit(Map<String, Object> queryMap) {
        return cinemaDao.edit(queryMap);
    }

    @Override
    public int updateStatus(Map<String, Object> queryMap) {
        return cinemaDao.updateStatus(queryMap);
    }

    @Override
    public int runTime(Integer cinemaId) {
        return cinemaDao.runTime(cinemaId);
    }


}
