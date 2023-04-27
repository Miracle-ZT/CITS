package sfw.xmut.pojo;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/24 16:19
 **/
public class Movie {
    private Integer movieId;
    private String chineseName;
    private String englishName;
    private String imgUrl;
//    private String types;               // 后续改为 一对多
    private List<Type> typeList;
    private Integer timeLen;
    private Date releaseDate;
    private String introduction;
    private String country;
    private String director;
    private String actors;
    private Integer movieStatus;
    private Date addDate;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Movie movie = (Movie) o;
        return Objects.equals(movieId, movie.movieId);
    }

    public Movie() {
    }

    public Movie(String chineseName, String englishName, String imgUrl, Integer timeLen, Date releaseDate, String introduction, String country, String director, String actors, Integer movieStatus, Date addDate) {
        this.chineseName = chineseName;
        this.englishName = englishName;
        this.imgUrl = imgUrl;
        this.timeLen = timeLen;
        this.releaseDate = releaseDate;
        this.introduction = introduction;
        this.country = country;
        this.director = director;
        this.actors = actors;
        this.movieStatus = movieStatus;
        this.addDate = addDate;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "movieId=" + movieId +
                ", chineseName='" + chineseName + '\'' +
                ", englishName='" + englishName + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", typeList=" + typeList +
                ", timeLen=" + timeLen +
                ", releaseDate=" + releaseDate +
                ", introduction='" + introduction + '\'' +
                ", country='" + country + '\'' +
                ", director='" + director + '\'' +
                ", actors='" + actors + '\'' +
                ", movieStatus=" + movieStatus +
                ", addDate=" + addDate +
                '}';
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public List<Type> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<Type> typeList) {
        this.typeList = typeList;
    }

    public Integer getTimeLen() {
        return timeLen;
    }

    public void setTimeLen(Integer timeLen) {
        this.timeLen = timeLen;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public Integer getMovieStatus() {
        return movieStatus;
    }

    public void setMovieStatus(Integer movieStatus) {
        this.movieStatus = movieStatus;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }
}
