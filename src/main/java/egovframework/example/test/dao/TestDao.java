package egovframework.example.test.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
import egovframework.example.test.vo.ReplyVO;
import egovframework.example.test.vo.ScheduleDTO;
import egovframework.example.test.vo.Search;
 
public interface TestDao {
	
	public void deleteUser(String userID) throws Exception;
	
	public void updateUser(UserVo vo) throws Exception;
	
	public void updateReply(ReplyVO vo) throws Exception;
	
	public void deleteReply(int rno) throws Exception;
	
	public void writeReply(ReplyVO vo) throws Exception;
	
	public UserVo signIn(UserVo userVo) throws Exception;
	
	public int checkID(UserVo userVo) throws Exception;
	
	public void register(UserVo userVo) throws Exception;
 
    public List<TestVo> selectTest(Search Search) throws Exception;
    
    public void insertTest(TestVo testVo) throws Exception;
    
    public TestVo selectDetail(int bbsID)throws Exception;
 
    public void updateTest(TestVo testVo) throws Exception;
 
    public void deleteTest(int bbsID) throws Exception;
    
    public int getBoardListCnt(Search search) throws Exception;
    
    public void insertFile(Map<String, Object> map) throws Exception;
    
    public List<Map<String, Object>> selectFileList(int bbsID) throws Exception;

    public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

    public void updateFile(Map<String, Object> map) throws Exception;
    
    public void addSchedule(ScheduleDTO dto) throws Exception;
	
	public List<ScheduleDTO> showSchedule(String userID) throws Exception;
	
	public List<ReplyVO> readReply(int bbsID) throws Exception;
	
	public void updateReplyCount(int bbsID) throws Exception;
	
	public UserVo selectUser(String userID) throws Exception;
}
