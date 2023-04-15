package sfw.xmut.service;

import org.springframework.stereotype.Service;
import sfw.xmut.pojo.Language;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/4/3 10:58
 **/
@Service
public interface LanguageService {
    public Language findLanguageId(Integer languageId);
    public List<Language> findLanguageList(Map<String, Object> queryMap);
}
