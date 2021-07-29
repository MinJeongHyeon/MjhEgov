package egovframework.example.test.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.SHA256;
import egovframework.example.test.service.TestService;
import egovframework.example.test.util.FileUtils;
import egovframework.example.test.vo.ReplyVO;
import egovframework.example.test.vo.ScheduleDTO;
import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
 
@Service
public class TestServiceImpl implements TestService{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
 
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
    public void insertTest(TestVo testVo, MultipartHttpServletRequest mpRequest) throws Exception {
        testDao.insertTest(testVo);
        
        List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(testVo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			testDao.insertFile(list.get(i)); 
		}
    }
 
    @Override
    public TestVo selectDetail(int bbsID) throws Exception {
        return testDao.selectDetail(bbsID);
    }
 
    @Override
	public void updateTest(TestVo testVo, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		testDao.updateTest(testVo);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(testVo, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				testDao.insertFile(tempMap);
			}else {
				testDao.updateFile(tempMap);
			}
		}
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

    @Override
	public List<Map<String, Object>> selectFileList(int bbsID) throws Exception {
		return testDao.selectFileList(bbsID);
	}
    
    @Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return testDao.selectFileInfo(map);
	}
    
    @Override
    public void addSchedule(ScheduleDTO dto) throws Exception {
    	testDao.addSchedule(dto);
    }
	
    @Override
	public List<ScheduleDTO> showSchedule(String userID) throws Exception {
    	return testDao.showSchedule(userID);
    }
    
    @Override
    public List<ReplyVO> readReply(int bbsID) throws Exception {
    	return testDao.readReply(bbsID);
    }
    
    @Override
    public void writeReply(ReplyVO vo) throws Exception {
    	testDao.writeReply(vo);
    }
}