package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
 
public interface TestService {
 
	public void register(UserVo userVo) throws Exception;
	
	public List<TestVo> selectTest(Search search) throws Exception;

    public void insertTest(TestVo testVo) throws Exception;
 
    public TestVo selectDetail(int bbsID) throws Exception;
 
    public void updateTest(TestVo testVo) throws Exception;
 
    public void deleteTest(int bbsID) throws Exception;
 
    public int getBoardListCnt(Search search) throws Exception;
}
