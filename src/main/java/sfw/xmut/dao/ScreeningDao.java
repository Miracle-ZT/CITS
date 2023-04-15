package sfw.xmut.dao;

import sfw.xmut.pojo.Room;
import sfw.xmut.pojo.Screening;
import sfw.xmut.pojo.Seat;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/4 20:29
 **/
public interface ScreeningDao {
    public Screening findScreeningById(Integer id);
    public List<Screening> findScreeningList(Map<String, Object> queryMap);
    public int updateSeats(Map<String, Object> queryMap);
    public Long totalNumByCinemaId(Integer cinemaId);
    public int add(Screening screening);
    public int generateSeat(Seat seat);
}
