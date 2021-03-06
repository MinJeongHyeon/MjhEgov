package egovframework.example.test.dao.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.vo.ReplyVO;
import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.TestMapper;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
import egovframework.example.test.vo.ScheduleDTO;
import egovframework.example.test.vo.Search;
 
@Repository
public class TestDaoImpl implements TestDao {
	
	@Override
	public void deleteUser(String userID) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.deleteUser(userID);
	}
	@Override
	public void updateUser(UserVo vo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.updateUser(vo);
	}
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
        mapper.fileUpdate(map);
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
    
    @Override
    public void addSchedule(ScheduleDTO dto) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.addSchedule(dto);
    }
	
    @Override
	public List<ScheduleDTO> showSchedule(String userID) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.showSchedule(userID);
    }
    
    @Override
    public List<ReplyVO> readReply(int bbsID) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        return mapper.readReply(bbsID);
    }
    
    @Override
    public void writeReply(ReplyVO vo) throws Exception {	
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.writeReply(vo);
    }
    
    @Override
    public void updateReply(ReplyVO vo) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.updateReply(vo);
    }
	
    @Override
	public void deleteReply(int rno) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.deleteReply(rno);
    }
    
    @Override
    public void updateReplyCount(int bbsID) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        mapper.updateReplyCount(bbsID);
    }
    
    @Override
    public UserVo selectUser(String userID) throws Exception {
    	TestMapper mapper = sqlSession.getMapper(TestMapper.class);
    	return mapper.selectUser(userID);
    }
                                       
}
