package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Cinema;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/28 18:32
 **/
@Service
public interface CinemaService {
    public List<Cinema> findCinemaListWithScreening(Map<String, Object> queryMap);
    public List<Cinema> findCinemaList(Map<String, Object> queryMap);
    public Cinema findCinemaById(Integer cinemaId);
    public int edit(Map<String, Object> queryMap);
    public int updateStatus(Map<String, Object> queryMap);
    public int runTime(Integer cinemaId);
}
