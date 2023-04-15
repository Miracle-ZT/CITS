package sfw.xmut.pojo;

import java.util.Date;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/14 16:52
 **/
public class Message {
    private Integer messageId;
    private Integer msgCinemaId;
    private Integer msgUserId;
    private String msgStr;
    private Date createTime;
    private Integer status;

    private Cinema msgCinema;
    private User msgUser;

    public Message(Integer messageId, Integer msgCinemaId, Integer msgUserId, String msgStr, Date createTime, Integer status) {
        this.messageId = messageId;
        this.msgCinemaId = msgCinemaId;
        this.msgUserId = msgUserId;
        this.msgStr = msgStr;
        this.createTime = createTime;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Message{" +
                "messageId=" + messageId +
                ", msgCinemaId=" + msgCinemaId +
                ", msgUserId=" + msgUserId +
                ", msgStr='" + msgStr + '\'' +
                ", createTime=" + createTime +
                ", status=" + status +
                ", msgCinema=" + msgCinema +
                ", msgUser=" + msgUser +
                '}';
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getMsgCinemaId() {
        return msgCinemaId;
    }

    public void setMsgCinemaId(Integer msgCinemaId) {
        this.msgCinemaId = msgCinemaId;
    }

    public Integer getMsgUserId() {
        return msgUserId;
    }

    public void setMsgUserId(Integer msgUserId) {
        this.msgUserId = msgUserId;
    }

    public String getMsgStr() {
        return msgStr;
    }

    public void setMsgStr(String msgStr) {
        this.msgStr = msgStr;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Cinema getMsgCinema() {
        return msgCinema;
    }

    public void setMsgCinema(Cinema msgCinema) {
        this.msgCinema = msgCinema;
    }

    public User getMsgUser() {
        return msgUser;
    }

    public void setMsgUser(User msgUser) {
        this.msgUser = msgUser;
    }
}
