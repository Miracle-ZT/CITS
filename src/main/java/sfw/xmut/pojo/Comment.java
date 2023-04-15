package sfw.xmut.pojo;

import java.util.Date;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/7 16:35
 **/
public class Comment {
    private Integer commentId;
    private Integer movieId;
    private Integer userId;
    private Date createTime;
    private String commentTitle;
    private String commentContent;

    public Comment() {
    }

    public Comment(Integer commentId, Integer movieId, Integer userId, Date createTime, String commentTitle, String commentContent) {
        this.commentId = commentId;
        this.movieId = movieId;
        this.userId = userId;
        this.createTime = createTime;
        this.commentTitle = commentTitle;
        this.commentContent = commentContent;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", movieId=" + movieId +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", commentTitle='" + commentTitle + '\'' +
                ", commentContent='" + commentContent + '\'' +
                '}';
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCommentTitle() {
        return commentTitle;
    }

    public void setCommentTitle(String commentTitle) {
        this.commentTitle = commentTitle;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
}
