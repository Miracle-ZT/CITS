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
    private Integer commentScore;
    private String commentContent;
    private Integer commentLikeCnt;
    private Integer isOrderComment;                 // 是否为来自订单的评论

    private Movie movie;
    private User user;

    public Comment() {
    }

    public Comment(Integer commentId, Integer movieId, Integer userId, Date createTime, Integer commentScore, String commentContent, Integer commentLikeCnt, Integer isOrderComment) {
        this.commentId = commentId;
        this.movieId = movieId;
        this.userId = userId;
        this.createTime = createTime;
        this.commentScore = commentScore;
        this.commentContent = commentContent;
        this.commentLikeCnt = commentLikeCnt;
        this.isOrderComment = isOrderComment;
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

    public Integer getCommentScore() {
        return commentScore;
    }

    public void setCommentScore(Integer commentScore) {
        this.commentScore = commentScore;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Integer getCommentLikeCnt() {
        return commentLikeCnt;
    }

    public void setCommentLikeCnt(Integer commentLikeCnt) {
        this.commentLikeCnt = commentLikeCnt;
    }

    public Integer getIsOrderComment() {
        return isOrderComment;
    }

    public void setIsOrderComment(Integer isOrderComment) {
        this.isOrderComment = isOrderComment;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
