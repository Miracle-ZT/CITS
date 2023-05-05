package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import sfw.xmut.dao.ScreeningDao;
import sfw.xmut.pojo.Screening;
import sfw.xmut.pojo.Seat;
import sfw.xmut.service.ScreeningService;

import java.util.Date;
import java.util.HashMap;
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

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false, isolation = Isolation.DEFAULT,rollbackFor = Exception.class)
    @Override
    public boolean lockSeat(Screening screening, Integer[] SeatsArray,Integer userId) {
        String oldSeats = screening.getSeat().getSeats();
        StringBuilder sbOldSeat = new StringBuilder(oldSeats);
        // 最终结果为当前用户本次所确认选座的座位的内容       '_'---未锁定   'o'---已锁定
        StringBuilder sbUserSeat = new StringBuilder();
        // 生成与当前场次长度相同的全为'_'的字符串
        for (int i = 0;i < screening.getSeat().getSeats().length();i++){
            sbUserSeat.append("_");
        }

        Map<String, Object> queryMap = new HashMap<>();
        queryMap.put("seatId",screening.getSeatId());
        queryMap.put("userId",userId);
        // 若用户已有锁定座位 的数据记录Map
        Map lockSeatMap = screeningDao.haveLock(queryMap);
        System.out.println("lockSeatMap = " + lockSeatMap);

        // 用户已有锁定的座位时
        if (lockSeatMap != null){
            // 该用户 旧的锁座信息
            String userLockedSeat = (String) lockSeatMap.get("seat_str");
            // 解锁用户原本锁定的座位
            for (int i = 0;i < userLockedSeat.length();i++){
                if (userLockedSeat.charAt(i) == 'o'){
                    sbOldSeat.setCharAt(i,'a');
                }
            }

            for(Integer i:SeatsArray){
                // 如果该用户选中的这个位置 已经售出或已被他人锁定
                if (oldSeats.charAt(i) == 's' || (oldSeats.charAt(i) == 'o' && userLockedSeat.charAt(i) != 'o')){
                    return false;
                }
                // 更新字符串中指定位置为--'o'
                sbOldSeat.setCharAt(i,'o');             // ___oo____ooo__   描述整个场次的
                // 该用户 新的锁座信息
                sbUserSeat.setCharAt(i,'o');            // ________oo____   描述当前用户的
            }

            // 已有时更新
            queryMap.put("seatId",screening.getSeatId());
            queryMap.put("userId",userId);
            queryMap.put("seatStr",sbUserSeat.toString());
            queryMap.put("createTime",new Date());
            screeningDao.updateLock(queryMap);
            queryMap.clear();
        }
        // 用户尚未锁定任何座位时
        else{
            for(Integer i:SeatsArray){
                // 如果该用户选中的这个位置 已经售出或已被他人锁定
                if (oldSeats.charAt(i) == 's' || oldSeats.charAt(i) == 'o'){
                    return false;
                }
                // 更新字符串中指定位置为--'o'
                sbOldSeat.setCharAt(i,'o');             // ___oo____ooo__   描述整个场次的
                // 该用户 新的锁座信息
                sbUserSeat.setCharAt(i,'o');            // ________oo____   描述当前用户的
            }
            // 没有时新增
            queryMap.put("seatId",screening.getSeatId());
            queryMap.put("userId",userId);
            queryMap.put("seatStr",sbUserSeat.toString());
            queryMap.put("createTime",new Date());
            screeningDao.addLock(queryMap);
            queryMap.clear();
        }

        queryMap.put("screening_id", screening.getScreeningId());
        queryMap.put("seats", sbOldSeat.toString());
        if (screeningDao.updateSeats(queryMap) > 0){
//            int i = 1/0;
            return true;
        }
        else {
            return false;
        }
    }

    // 存在已锁定的座位时返回seat_str 不存在则返回""
    @Override
    public String findOldSeatStrByMap(Integer seatId,Integer userId) {
        Map<String, Object> queryMap = new HashMap<>();
        queryMap.put("seatId",seatId);
        queryMap.put("userId",userId);
        Map lockSeatMap = screeningDao.haveLock(queryMap);
        if (lockSeatMap != null){
            return (String) lockSeatMap.get("seat_str");
        }
        return "";
    }


}
