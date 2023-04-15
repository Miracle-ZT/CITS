package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.ScreeningDao;
import sfw.xmut.pojo.Screening;
import sfw.xmut.pojo.Seat;
import sfw.xmut.service.ScreeningService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/4 20:59
 **/
@Service
public class ScreeningServiceImpl implements ScreeningService {

    @Autowired
    private ScreeningDao screeningDao;

    @Override
    public Screening findScreeningById(Integer id) {
        return screeningDao.findScreeningById(id);
    }

    @Override
    public List<Screening> findScreeningList(Map<String, Object> queryMap) {
        return screeningDao.findScreeningList(queryMap);
    }

    @Override
    public int updateSeats(Map<String, Object> queryMap) {
        return screeningDao.updateSeats(queryMap);
    }

    @Override
    public Long totalNumByCinemaId(Integer cinemaId) {
        return screeningDao.totalNumByCinemaId(cinemaId);
    }

    @Override
    public int add(Screening screening) {
        return screeningDao.add(screening);
    }

    @Override
    public int generateSeat(Seat seat) {
        return screeningDao.generateSeat(seat);
    }
}
