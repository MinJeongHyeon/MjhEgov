package egovframework.example.test.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
 
public interface TestService {
	
	public void updateTest(TestVo testVo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public UserVo signIn(UserVo userVo) throws Exception;
	 
	public int checkID(UserVo userVo) throws Exception;
 
	public void register(UserVo userVo) throws Exception;
	
	public List<TestVo> selectTest(Search search) throws Exception;

    public void insertTest(TestVo testVo, MultipartHttpServletRequest mpRequest) throws Exception;
 
    public TestVo selectDetail(int bbsID) throws Exception;
 
    public void deleteTest(int bbsID) throws Exception;
 
    public int getBoardListCnt(Search search) throws Exception;
    
    public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
    
    public List<Map<String, Object>> selectFileList(int bbsID) throws Exception;
}
