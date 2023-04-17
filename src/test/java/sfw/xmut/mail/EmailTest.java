package sfw.xmut.mail;

import org.junit.Test;
import sfw.xmut.util.EmailUtils;
import sfw.xmut.util.VerificationCodeUtils;

import java.util.Arrays;
import java.util.List;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/4/16 21:25
 **/
public class EmailTest {
    @Test
    public void sendEmail(String to,String VCode) throws Exception {
        //QQ邮箱测试
        String userName = "2632687880@qq.com"; // 发件人邮箱
        String password = "nbyfiulewgeiebdh"; // 发件人密码，其实不一定是邮箱的登录密码，对于QQ邮箱来说是SMTP服务的授权文本
        String smtpHost = "smtp.qq.com"; // 邮件服务器

        //163邮箱测试
        // String userName = "gblfy02@163.com"; // 发件人邮箱
        // String password = "TBFJUSKCUOPEYOYU"; // 发件人密码，其实不一定是邮箱的登录密码，对于QQ邮箱来说是SMTP服务的授权文本
        // String smtpHost = "smtp.163.com"; // 邮件服务器

//        String to = "2632687880@qq.com"; // 收件人，多个收件人以半角逗号分隔
        String cc = ""; // 抄送，多个抄送以半角逗号分隔
        String subject = "XLMovie - 保护验证"; // 主题
        String body = "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title></title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h3>" + to + "，你好!</h3>\n" +
                "\n" +
                "<h3>我们已收到你要求获得 XLMovie 帐户所用的一次性代码的申请。</h3>\n" +
                "\n" +
                "<span style=\"font-size: 30px\">你的一次性代码为: </span>\n" +
                "<span style=\"font-size: 40px;color: #b92222;border-radius: 5px;border: 1px #d3d3d3 solid\">" + VCode + "</span>\n" +
                "<br>\n" +
                "<h3>如果你没有请求此代码，可放心忽略这封电子邮件。别人可能错误地键入了你的电子邮件地址。</h3>\n" +
                "<br>\n" +
                "<br>\n" +
                "<h4>谢谢! </h4>\n" +
                "<h4>XLMovie 帐户团队</h4>\n" +
                "<br>\n" +
                "</body>\n" +
                "</html>"; // 正文，可以用html格式
//        List<String> attachments = Arrays.asList("D:\\files.pdf", "D:\\安装包\\权限控制优化需求.docx"); // 附件的路径，多个附件也不怕
        List<String> attachments = null;

        EmailUtils emailUtils = EmailUtils.entity(smtpHost, userName, password, to, cc, subject, body, attachments);

        emailUtils.send(); // 发送！
    }
}
