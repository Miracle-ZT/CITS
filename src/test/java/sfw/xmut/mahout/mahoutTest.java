package sfw.xmut.mahout;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLBooleanPrefJDBCDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/4/16 11:20
 **/
public class mahoutTest {
    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {

    }

    // 初始 = 1.0
    // 浏览  +0.5
    // 评价  -1.5/+0/+1.5
    // 生成订单  +3.0
    // 支付成功  +4.0
    // 收藏  +4.5
    @Test
    public void CF() throws TasteException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName("localhost");
        dataSource.setUser("root");
        dataSource.setPassword("root");
        dataSource.setDatabaseName("cits");
        // 实例化DataModel并将数据传入其内
        DataModel dataModel = new MySQLJDBCDataModel(dataSource,"preference","user_id","movie_id","preference_val",null);

        // userCF
        UserSimilarity similarity=new PearsonCorrelationSimilarity(dataModel);
//        System.out.println("similarity = " + similarity);
        UserNeighborhood neighborhood=new NearestNUserNeighborhood(30,similarity,dataModel);
//        UserNeighborhood neighborhood = new ThresholdUserNeighborhood(3.0, similarity, dataModel);
        Recommender recommender=new GenericUserBasedRecommender(dataModel,neighborhood,similarity);
        // the Recommender.recommend() method's arguments: first one is the user id;
        //     the second one is the number recommended
        List<RecommendedItem> recommendations=recommender.recommend(1,7);
        System.out.println("size=" + recommendations.size());
        for(RecommendedItem recommendation:recommendations){
            System.out.println(recommendation);
        }
    }
}
