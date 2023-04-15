package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.MessageDao;
import sfw.xmut.pojo.Message;
import sfw.xmut.service.MessageService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/14 17:22
 **/
@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;

    @Override
    public Message findMessageById(Integer messageId) {
        return messageDao.findMessageById(messageId);
    }

    @Override
    public List<Message> findMessageList(Map<String, Object> queryMap) {
        return messageDao.findMessageList(queryMap);
    }

    @Override
    public int add(Message message) {
        return messageDao.add(message);
    }

    @Override
    public int notReadCnt() {
        return messageDao.notReadCnt();
    }

    @Override
    public int updateStatus(Integer messageId) {
        return messageDao.updateStatus(messageId);
    }
}
