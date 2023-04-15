package sfw.xmut.pojo;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/6 14:54
 **/
public class Seat {
    private Integer seatId;
    private Integer row;
    private Integer col;
    private String seats;

    public Seat() {
    }

    public Seat(Integer row, Integer col, String seats) {
        this.row = row;
        this.col = col;
        this.seats = seats;
    }

    public Integer getSeatId() {
        return seatId;
    }

    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    public Integer getRow() {
        return row;
    }

    public void setRow(Integer row) {
        this.row = row;
    }

    public Integer getCol() {
        return col;
    }

    public void setCol(Integer col) {
        this.col = col;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }
}
