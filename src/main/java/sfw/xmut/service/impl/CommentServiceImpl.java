package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.CommentDao;
import sfw.xmut.pojo.Comment;
import sfw.xmut.service.CommentService;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/7 19:23
 **/
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public int add(Comment comment) {
        return commentDao.add(comment);
    }
}
