package egovframework.example.test.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.TestMapper;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
import egovframework.example.test.vo.Search;
 
@Repository
public class TestDaoImpl implements TestDao {
 
    @Autowired
    private SqlSession sqlSession;
    
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
