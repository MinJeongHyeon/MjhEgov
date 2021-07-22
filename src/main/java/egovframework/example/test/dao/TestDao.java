package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
import egovframework.example.test.vo.Search;
 
public interface TestDao {
	
	public void register(UserVo userVo) throws Exception;
 
    public List<TestVo> selectTest(Search Search) throws Exception;
    
    public void insertTest(TestVo testVo) throws Exception;
    
    public TestVo selectDetail(int bbsID)throws Exception;
 
    public void updateTest(TestVo testVo) throws Exception;
 
    public void deleteTest(int bbsID) throws Exception;
    
    public int getBoardListCnt(Search search) throws Exception;
    

}
