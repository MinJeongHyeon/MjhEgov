package egovframework.example.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVo;
 
@Service
public class TestServiceImpl implements TestService{
 
    @Autowired
    private TestDao testDao;
    
    @Override
    public List<TestVo> selectTest(TestVo testVo) throws Exception {
        return testDao.selectTest(testVo);
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
 
}