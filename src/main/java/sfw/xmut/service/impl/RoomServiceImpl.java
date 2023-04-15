package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.RoomDao;
import sfw.xmut.pojo.Room;
import sfw.xmut.service.RoomService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/14 15:14
 **/
@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDao roomDao;
    @Override
    public List<Room> findRoomList(Map<String, Object> queryMap) {
        return roomDao.findRoomList(queryMap);
    }

    @Override
    public Room findRoomById(Integer id) {
        return roomDao.findRoomById(id);
    }

    @Override
    public int updateLayout(Map<String, Object> queryMap) {
        return roomDao.updateLayout(queryMap);
    }

    @Override
    public int add(Room room) {
        return roomDao.add(room);
    }
}
