package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.CommentDao;
import sfw.xmut.pojo.Comment;
import sfw.xmut.service.CommentService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/7 19:23
 **/
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public Comment findCommentById(Integer commentId) {
        return commentDao.findCommentById(commentId);
    }

    @Override
    public List<Comment> findCommentListByMovieId(Integer movieId) {
        return commentDao.findCommentListByMovieId(movieId);
    }

    @Override
    public int add(Comment comment) {
        return commentDao.add(comment);
    }

    @Override
    public int clickLike(Map<String, Object> queryMap) {
        // 点赞和取消点赞 都需要修改两个表 --- 主表comment和中间表comment_like --- 保证数据一致性
        Integer commentId = (Integer) queryMap.get("commentId");

        boolean isExist = commentDao.isExist(queryMap);
        if (!isExist){                                      // 如果不存在
            // 插入中间表数据
            commentDao.addLike(queryMap);
            // 更新主表内的值
            commentDao.addLikeNumByCommentId((Integer) queryMap.get("commentId"));
            return 1;
        }
        else {                                              // 如果存在
            int isValid = commentDao.checkLikeStatus(queryMap);
            if (isValid == 1){                              // 有效
                // 更新主表内的值
                commentDao.subLikeNumByCommentId(commentId);
                // 更新中间表内的值
                queryMap.put("commentLikeStatus",0);
                commentDao.updateLikeStatus(queryMap);
                return 0;
            }
            else {                                          // 无效
                // 更新主表内的值
                commentDao.addLikeNumByCommentId(commentId);
                // 更新中间表内的值
                queryMap.put("commentLikeStatus",1);
                commentDao.updateLikeStatus(queryMap);
                return 1;
            }
        }
    }

    @Override
    public Integer checkLike(Map<String, Object> queryMap) {
        boolean isExist = commentDao.isExist(queryMap);
        if (!isExist){                                      // 如果不存在
            return 0;
        }
        else {                                              // 如果存在
            int isValid = commentDao.checkLikeStatus(queryMap);
            return isValid;
        }
    }
}
