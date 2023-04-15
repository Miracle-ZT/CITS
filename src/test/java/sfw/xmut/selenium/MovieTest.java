package sfw.xmut.selenium;

import cn.hutool.core.io.FileUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import sfw.xmut.pojo.Movie;
import sfw.xmut.service.MovieService;
import sfw.xmut.service.impl.MovieServiceImpl;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/31 21:04
 **/
public class MovieTest {
    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void findMovieByIdDemo() {
        // 生成指定url对应的二维码到文件，宽和高都是500像素
        QrCodeUtil.generate("testText", 500, 500, FileUtil.file("d:/qrcodetest.jpg"));
    }
}
