package sfw.xmut.dao;

import org.apache.ibatis.annotations.Param;
import sfw.xmut.pojo.Type;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/25 13:59
 **/
public interface TypeDao {
    public Type findTypeById(Integer typeId);
    public List<Type> findTypeList(Map<String, Object> queryMap);
    public int add(Type type);
    public int edit(Type type);
    public int delRelationByMovieId(Integer movieId);
    public int addRelationByList(@Param("typeList") Integer[] typeList, @Param("movieId") Integer movieId);
}
