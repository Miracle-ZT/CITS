package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Room;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/14 15:13
 **/
@Service
public interface RoomService {
    public List<Room> findRoomList(Map<String, Object> queryMap);
    public Room findRoomById(Integer id);
    public int updateLayout(Map<String, Object> queryMap);
    public int add(Room room);
}
