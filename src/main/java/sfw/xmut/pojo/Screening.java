package sfw.xmut.pojo;

import java.util.Date;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/4 20:24
 **/
public class Screening {
    private Integer screeningId;
    private Integer cinemaId;
    private Integer movieId;
    private Integer languageId;
    private float price;
    private Integer roomId;
    private Date startTime;
    private Date endTime;
    private Integer seatId;
    private Cinema cinema;
    private Movie movie;
    private Language language;
    private Seat seat;
    private Room room;

    @Override
    public String toString() {
        return "Screening{" +
                "screeningId=" + screeningId +
                ", cinemaId=" + cinemaId +
                ", movieId=" + movieId +
                ", languageId=" + languageId +
                ", price=" + price +
                ", roomId=" + roomId +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", seatId=" + seatId +
                ", cinema=" + cinema +
                ", movie=" + movie +
                ", language=" + language +
                ", seat=" + seat +
                ", room=" + room +
                '}';
    }

    public Screening() {
    }

    public Screening(Integer cinemaId, Integer movieId, Integer languageId, float price, Integer roomId, Date startTime, Date endTime, Integer seatId) {
        this.cinemaId = cinemaId;
        this.movieId = movieId;
        this.languageId = languageId;
        this.price = price;
        this.roomId = roomId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.seatId = seatId;
    }

    public Integer getScreeningId() {
        return screeningId;
    }

    public void setScreeningId(Integer screeningId) {
        this.screeningId = screeningId;
    }

    public Integer getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Integer getLanguageId() {
        return languageId;
    }

    public void setLanguageId(Integer languageId) {
        this.languageId = languageId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getSeatId() {
        return seatId;
    }

    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    public Cinema getCinema() {
        return cinema;
    }

    public void setCinema(Cinema cinema) {
        this.cinema = cinema;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}
