package sfw.xmut.pojo;

import java.util.Date;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/24 19:48
 **/
public class Banner {
    private Integer banId;
    private String path;
    private Integer movieId;
    private Date banAddDate;

    private Movie movie;

    public Banner() {
    }

    public Banner(String path, Integer movieId, Date banAddDate, Movie movie) {
        this.path = path;
        this.movieId = movieId;
        this.banAddDate = banAddDate;
        this.movie = movie;
    }

    @Override
    public String toString() {
        return "Banner{" +
                "banId=" + banId +
                ", path='" + path + '\'' +
                ", movieId=" + movieId +
                ", banAddDate=" + banAddDate +
                ", movie=" + movie +
                '}';
    }

    public Integer getBanId() {
        return banId;
    }

    public void setBanId(Integer banId) {
        this.banId = banId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Date getBanAddDate() {
        return banAddDate;
    }

    public void setBanAddDate(Date banAddDate) {
        this.banAddDate = banAddDate;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }
}
