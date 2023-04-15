package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Message;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/14 17:18
 **/
@Service
public interface MessageService {
    public Message findMessageById(Integer messageId);
    public List<Message> findMessageList(Map<String, Object> queryMap);
    public int add(Message message);
    public int notReadCnt();
    public int updateStatus(Integer messageId);
}
