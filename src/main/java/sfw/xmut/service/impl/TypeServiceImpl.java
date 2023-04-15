package sfw.xmut.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.TypeDao;
import sfw.xmut.pojo.Type;
import sfw.xmut.service.TypeService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/3/25 14:00
 **/
@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeDao typeDao;

    @Override
    public Type findTypeById(Integer typeId) {
        return typeDao.findTypeById(typeId);
    }

    @Override
    public List<Type> findTypeList(Map<String, Object> queryMap) {
        return typeDao.findTypeList(queryMap);
    }

    @Override
    public int add(Type type) {
        return typeDao.add(type);
    }

    @Override
    public int edit(Type type) {
        return typeDao.edit(type);
    }

    @Override
    public int delRelationByMovieId(Integer movieId) {
        return typeDao.delRelationByMovieId(movieId);
    }

    @Override
    public int addRelationByList(Integer[] typeList, Integer movieId) {
        return typeDao.addRelationByList(typeList,movieId);
    }
}
