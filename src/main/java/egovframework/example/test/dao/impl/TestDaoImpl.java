package egovframework.example.test.dao.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.TestMapper;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
import egovframework.example.test.vo.Search;
 
@Repository
public class TestDaoImpl implements TestDao {
	
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.updateFile(map);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.selectFileInfo(map);
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int bbsID) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.selectFileList(bbsID);
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.insertFile(map);
	}
 
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public UserVo signIn(UserVo userVo) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.signIn(userVo);
    }
    
    @Override
	public int checkID(UserVo userVo) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.checkID(userVo);
    }
	
    @Override
    public void register(UserVo userVo) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.register(userVo);
    }
    
    @Override
    public List<TestVo> selectTest(Search search) throws Exception {
        TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.selectTest(search);
    }
    
    @Override
    public void insertTest(TestVo testVo) throws Exception {
        TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.insertTest(testVo);
    }
 
    @Override
    public TestVo selectDetail(int bbsID) throws Exception {
        TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.selectDetail(bbsID);
    }
 
    @Override
    public void updateTest(TestVo testVo) throws Exception {
        TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.updateTest(testVo);
    }
 
    @Override
    public void deleteTest(int bbsID) throws Exception {
        TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.deleteTest(bbsID);
    }
    @Override
    public int getBoardListCnt(Search search) throws Exception {
        TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.getBoardListCnt(search);
    }
                                       
}
