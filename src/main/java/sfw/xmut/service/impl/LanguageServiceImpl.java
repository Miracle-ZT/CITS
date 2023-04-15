package sfw.xmut.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sfw.xmut.dao.LanguageDao;
import sfw.xmut.pojo.Language;
import sfw.xmut.service.LanguageService;

import java.util.List;
import java.util.Map;

/**
 * 　　　　* @author ZT
 * 　　　　* @date 2023/4/3 11:06
 **/
@Service
public class LanguageServiceImpl implements LanguageService {

    @Autowired
    private LanguageDao languageDao;

    @Override
    public Language findLanguageId(Integer languageId) {
        return languageDao.findLanguageId(languageId);
    }

    @Override
    public List<Language> findLanguageList(Map<String, Object> queryMap) {
        return languageDao.findLanguageList(queryMap);
    }
}
