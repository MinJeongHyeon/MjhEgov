package egovframework.example.test.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.SHA256;
import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
 
@Service
public class TestServiceImpl implements TestService{
 
    @Autowired
    private TestDao testDao;
    
    @Override
    public UserVo signIn(UserVo userVo) throws Exception {
    	SHA256 sha256 = new SHA256();
		userVo.setUserPassword(sha256.encrypt(userVo.getUserPassword()));
    	return testDao.signIn(userVo);
    }
    @Override
    public int checkID(UserVo userVo) throws Exception {
    	return testDao.checkID(userVo);
    }
    
    @Override
    public void register(UserVo userVo) throws Exception {
    	SHA256 sha256 = new SHA256();
		userVo.setUserPassword(sha256.encrypt(userVo.getUserPassword()));
    	testDao.register(userVo);
    }
    
    @Override
    public List<TestVo> selectTest(Search search) throws Exception {
    	if (search.getKeyword() != null && !search.getKeyword().equals("")) {
    	String[] words = search.getKeyword().trim().split("\\s+");
    	search.setWords(words);
    	}
        return testDao.selectTest(search);
    }
    
    @Override
    public void insertTest(TestVo testVo) throws Exception {
        testDao.insertTest(testVo);
    }
 
    @Override
    public TestVo selectDetail(int bbsID) throws Exception {
        return testDao.selectDetail(bbsID);
    }
 
    @Override
    public void updateTest(TestVo testVo) throws Exception {
        testDao.updateTest(testVo);
    }
 
    @Override
    public void deleteTest(int bbsID) throws Exception {
        testDao.deleteTest(bbsID);
    }
 
    @Override
    public int getBoardListCnt(Search search) throws Exception {
    	if (search.getKeyword() != null && !search.getKeyword().equals("")) {
        	String[] words = search.getKeyword().trim().split("\\s+");
        	search.setWords(words);
        	}
        return testDao.getBoardListCnt(search);
    }

}