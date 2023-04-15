package sfw.xmut.pojo;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/1/16 16:05
 **/
public class User {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String photo;//头像照片地址
    private String phone;
    private Integer sex;
//    private Integer age;//年龄
//    private String address;//家庭住址


    public User() {
    }

    public User(Integer id, String username, String password, String email, String photo, String phone, Integer sex) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.photo = photo;
        this.phone = phone;
        this.sex = sex;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }
}
