package sfw.xmut.pojo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/4/16 21:15
 **/
public class MyAuthenticator extends Authenticator {

    String userName = null;
    String password = null;

    public MyAuthenticator() {
    }

    public MyAuthenticator(String username, String password) {
        this.userName = username;
        this.password = password;
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, password);
    }

}
