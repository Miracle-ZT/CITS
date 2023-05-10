package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Comment;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/7 19:22
 **/
@Service
public interface CommentService {
    public Comment findCommentById(Integer commentId);
    public List<Comment> findCommentListByMovieId(Integer movieId);
    public List<Comment> findCommentListByUserId(Integer userId);
    public int add(Comment comment);
    public int delete(Integer commentId);
    public int clickLike(Map<String, Object> queryMap);
    public Integer checkLike(Map<String, Object> queryMap);
}
