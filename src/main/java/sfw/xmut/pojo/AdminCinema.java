package sfw.xmut.pojo;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/2/13 16:25
 **/
public class AdminCinema {
    private Integer adminCinemaId;
    private String name;
    private String password;
    private String email;
    private String phone;
    private Integer cinemaId;

    @Override
    public String toString() {
        return "AdminCinema{" +
                "adminCinemaId=" + adminCinemaId +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", cinemaId=" + cinemaId +
                '}';
    }

    public Integer getAdminCinemaId() {
        return adminCinemaId;
    }

    public void setAdminCinemaId(Integer adminCinemaId) {
        this.adminCinemaId = adminCinemaId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }
}
