package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.TestVo;
 
public interface TestService {
 
    public List<TestVo> selectTest(TestVo testVo) throws Exception;
    
    public void insertTest(TestVo testVo) throws Exception;
 
    public TestVo selectDetail(int bbsID) throws Exception;
 
    public void updateTest(TestVo testVo) throws Exception;
 
    public void deleteTest(int bbsID) throws Exception;
 
}
