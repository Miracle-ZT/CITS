package sfw.xmut.dao;

import sfw.xmut.pojo.Comment;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/7 16:40
 **/
public interface CommentDao {
    public Comment findCommentById(Integer commentId);
    public List<Comment> findCommentListByMovieId(Integer movieId);
    public int add(Comment comment);

    public int addLikeNumByCommentId(Integer commentId);
    public int subLikeNumByCommentId(Integer commentId);

    // 点赞模块部分
    public boolean isExist(Map<String, Object> queryMap);
    public int addLike(Map<String, Object> queryMap);
    public Integer checkLikeStatus(Map<String, Object> queryMap);
    public int updateLikeStatus(Map<String, Object> queryMap);
}
