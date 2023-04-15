package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Comment;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/7 19:22
 **/
@Service
public interface CommentService {
    public int add(Comment comment);
}
