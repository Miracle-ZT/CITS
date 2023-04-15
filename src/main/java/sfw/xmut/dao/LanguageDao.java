package sfw.xmut.dao;

import sfw.xmut.pojo.Language;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/4/3 10:56
 **/
public interface LanguageDao {
    public Language findLanguageId(Integer languageId);
    public List<Language> findLanguageList(Map<String, Object> queryMap);
}
