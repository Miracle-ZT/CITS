package sfw.xmut.pojo;

import java.util.Date;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/11 18:28
 **/
public class Orders {
    private Integer orderId;
    private Integer screeningId;
    private Integer userId;
    private Date createTime;
    private float totalPrice;
    private Integer totalNOP;
    private Integer status;
    private String seatNums;
    private String orderNum;
    private String QRCode;
    private Integer isCommented;                // 该订单是否被评论过

    private Screening screening;
    private User user;

    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", screeningId=" + screeningId +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", totalPrice=" + totalPrice +
                ", totalNOP=" + totalNOP +
                ", status=" + status +
                ", seatNums='" + seatNums + '\'' +
                ", orderNum='" + orderNum + '\'' +
                ", QRCode='" + QRCode + '\'' +
                ", isCommented=" + isCommented +
                ", screening=" + screening +
                ", user=" + user +
                '}';
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getScreeningId() {
        return screeningId;
    }

    public void setScreeningId(Integer screeningId) {
        this.screeningId = screeningId;
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

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getTotalNOP() {
        return totalNOP;
    }

    public void setTotalNOP(Integer totalNOP) {
        this.totalNOP = totalNOP;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSeatNums() {
        return seatNums;
    }

    public void setSeatNums(String seatNums) {
        this.seatNums = seatNums;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getQRCode() {
        return QRCode;
    }

    public void setQRCode(String QRCode) {
        this.QRCode = QRCode;
    }

    public Integer getIsCommented() {
        return isCommented;
    }

    public void setIsCommented(Integer isCommented) {
        this.isCommented = isCommented;
    }

    public Screening getScreening() {
        return screening;
    }

    public void setScreening(Screening screening) {
        this.screening = screening;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
