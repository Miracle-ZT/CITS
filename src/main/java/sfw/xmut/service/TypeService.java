package sfw.xmut.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Type;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/25 14:00
 **/
@Service
public interface TypeService {
    public Type findTypeById(Integer typeId);
    public List<Type> findTypeList(Map<String, Object> queryMap);
    public int add(Type type);
    public int edit(Type type);
    public int delRelationByMovieId(Integer movieId);
    public int addRelationByList(Integer[] typeList, Integer movieId);
}
