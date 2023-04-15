package sfw.xmut.pojo;

import java.util.Date;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/28 17:05
 **/
public class Cinema {
    private Integer cinemaId;
    private String name;
    private String address;
    private String phone;
    private String city;
    private String photo;
    private Date joinDate;
    private Integer cinemaStatus;
    private Integer adminCinemaId;
    private Integer brandId;

    private AdminCinema adminCinema;
    private Brand brand;

    public Cinema() {
    }

    @Override
    public String toString() {
        return "Cinema{" +
                "cinemaId=" + cinemaId +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", city='" + city + '\'' +
                ", photo='" + photo + '\'' +
                ", joinDate=" + joinDate +
                ", cinemaStatus=" + cinemaStatus +
                ", adminCinemaId=" + adminCinemaId +
                ", brandId=" + brandId +
                ", adminCinema=" + adminCinema +
                ", brand=" + brand +
                '}';
    }

    public Integer getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public Integer getCinemaStatus() {
        return cinemaStatus;
    }

    public void setCinemaStatus(Integer cinemaStatus) {
        this.cinemaStatus = cinemaStatus;
    }

    public Integer getAdminCinemaId() {
        return adminCinemaId;
    }

    public void setAdminCinemaId(Integer adminCinemaId) {
        this.adminCinemaId = adminCinemaId;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public AdminCinema getAdminCinema() {
        return adminCinema;
    }

    public void setAdminCinema(AdminCinema adminCinema) {
        this.adminCinema = adminCinema;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }
}
