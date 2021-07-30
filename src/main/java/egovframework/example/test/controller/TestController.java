package egovframework.example.test.controller;
 
import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.UserVo;
import egovframework.example.test.vo.ReplyVO;
import egovframework.example.test.vo.ScheduleDTO;

@Controller
public class TestController {
    
    @Autowired
    private TestService testService;
    
    // 회원 탈퇴
    @RequestMapping(value="/deleteUser.do", method = RequestMethod.POST)
  	public String deleteUser(HttpServletRequest request) throws Exception {
    	String userID = request.getParameter("userID");
  		testService.deleteUser(userID);
  		return "redirect:/logout.do";
  	}
    
    // 회원 정보 수정
    @RequestMapping(value="/updateUser.do", method = RequestMethod.POST)
  	public String updateUser(UserVo vo) throws Exception {
  		testService.updateUser(vo);
  		return "redirect:/userUpdatePage.do";
  	}
    
    // 회원 정보 수정 페이지
    @RequestMapping(value="/userUpdatePage.do")
    public String userUpdatePage(Model model, HttpServletRequest req) throws Exception{
    	UserVo userVo = (UserVo) req.getSession().getAttribute("user");
    	model.addAttribute("user", testService.selectUser(userVo.getUserID()));
        return "test/userUpdatePage";
    }
    
    // 마이 페이지
    @RequestMapping(value="/myPage.do")
    public String myPage(){
        return "test/myPage";
    }
    
    // 회원탈퇴 페이지
    @RequestMapping(value="/withdrawPage.do")
    public String withdrawPage(){
        return "test/withdrawPage";
    }
    
    // 댓글 삭제 완료
    @RequestMapping(value="/deleteReply.do")
    public String deleteReply(HttpServletRequest request) throws Exception {
        int rno = Integer.parseInt(request.getParameter("rno"));
        int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        testService.deleteReply(rno);
  		testService.updateReplyCount(bbsID);
        String referer = request.getHeader("Referer");
		return "redirect:" + referer;
    }
    
    // 댓글 수정
  	@RequestMapping(value="/updateReply.do", method = RequestMethod.POST)
  	public String updateReply(ReplyVO vo) throws Exception {
  		testService.updateReply(vo);
  		return "redirect:/testDetail.do?bbsID="+vo.getBbsID();
  	}
  	
    // 댓글 작성
  	@RequestMapping(value="/replyWrite.do", method = RequestMethod.POST)
  	public String replyWrite(ReplyVO vo) throws Exception {
  		testService.writeReply(vo);
  		testService.updateReplyCount(vo.getBbsID());
  		return "redirect:/testDetail.do?bbsID="+vo.getBbsID();
  	}
  	
    // 일정 추가
    @ResponseBody
    @RequestMapping(value="/addSchedule.do", produces="text/json; charset=utf-8", method = RequestMethod.POST)
    public String addSchedule(ScheduleDTO dto) throws Exception {
    	testService.addSchedule(dto);
    	return "1";
    }
    
    // 일정 추가 팝업
    @RequestMapping(value="/schedulePopup.do")
    public String schedulePopup(){
        return "test/schedulePopup";
    }
    
    // 스케줄러
    @RequestMapping(value="/schedule.do")
    public String schedule(Model model, HttpServletRequest req) throws Exception{
    	HttpSession session = req.getSession();
    	UserVo userVo = (UserVo) session.getAttribute("user");
    	model.addAttribute("showSchedule", testService.showSchedule(userVo.getUserID()));
        return "test/schedule";
    }
    
    // 메인 페이지
    @RequestMapping(value="/main.do")
    public String main(){
        return "test/main";
    }
    
    // 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="/checkID.do", produces="text/json; charset=utf-8", method = RequestMethod.POST)
    public String checkID(UserVo userVo) throws Exception {
    	int result = testService.checkID(userVo);
    	return Integer.toString(result);
    }
    
    // 로그인 페이지
    @RequestMapping(value="/login.do")
    public String login(HttpServletRequest req){
    	String referrer = req.getHeader("Referer");
    	req.getSession().setAttribute("prevPage", referrer);
        return "test/login";
    }
    
    // 로그인 하기
    @RequestMapping(value = "/signIn.do", method = RequestMethod.POST)
	public String signIn(UserVo userVo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
    	
		HttpSession session = req.getSession();
		UserVo signIn = testService.signIn(userVo);
		
		if(signIn == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:login.do";
		}else {
			session.setAttribute("user", signIn);
		}
		
		String referer = (String) req.getSession().getAttribute("prevPage");
		return "redirect:" + referer;
	}
    
    // 로그아웃
    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
	
		return "redirect:main.do";
	}
    
    // 회원가입 페이지
    @RequestMapping(value="/join.do")
    public String join(HttpServletRequest req){
    	String referrer = req.getHeader("Referer");
    	req.getSession().setAttribute("prevPage", referrer);
        return "test/join";
    }
    
    // 회원가입 하기
    @RequestMapping(value="/register.do")
    public String register(@ModelAttribute("userVo") UserVo userVo, HttpServletRequest req) throws Exception {
        testService.register(userVo);
        String referer = (String) req.getSession().getAttribute("prevPage");
		return "redirect:" + referer;
    }

    // 글목록페이지,페이징,검색
    @RequestMapping(value="/testList.do")
    public String testListDo(Model model
            ,@RequestParam(required=false,defaultValue="1")int page
            ,@RequestParam(required=false,defaultValue="1")int range
            ,@RequestParam(required=false,defaultValue="bbsTitle")String searchType
            ,@RequestParam(required=false)String keyword
            ,@ModelAttribute("search")Search search) throws Exception{
        
    	
        // 검색
        model.addAttribute("search", search);
        search.setSearchType(searchType);
        search.setKeyword(keyword);
      
        int listCnt = testService.getBoardListCnt(search);
        
        // 검색 후 페이지
        search.pageInfo(page, range, listCnt);
        // 페이징
        model.addAttribute("pagination", search);
        // 게시글 화면 출력
        model.addAttribute("list", testService.selectTest(search));
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -1); //7일간 보이도록 하기위해서.
        String nowday = format.format(cal.getTime());
        model.addAttribute("nowday",nowday);
        
        return "test/testList";
    }

    // 게시글 읽기
    @RequestMapping(value="/testDetail.do")
    public String viewForm(Model model, HttpServletRequest request) throws Exception{
    	
        int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        
        TestVo testVo = testService.selectDetail(bbsID);
        model.addAttribute("vo", testVo);
        
        List<Map<String, Object>> fileList = testService.selectFileList(bbsID);
        model.addAttribute("file", fileList);
       
        List<ReplyVO> replyList = testService.readReply(bbsID);
        model.addAttribute("replyList", replyList);
        return "test/testDetail";
    }
    
    // 파일 다운
    @RequestMapping(value="/fileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = testService.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
    
    // 게시글 작성 페이지
    @RequestMapping(value="/testRegister.do")
    public String testRegister(){
        return "test/testRegister";
    }
    
    // 게시글 작성 완료
    @RequestMapping(value="/insertTest.do")
    public String write(@ModelAttribute("testVo") TestVo testVo, MultipartHttpServletRequest mpRequest) throws Exception {
        testService.insertTest(testVo, mpRequest);
        return "redirect:testDetail.do?bbsID="+testVo.getBbsID();
    }
    
    // 게시글 수정 페이지
    @RequestMapping(value = "/update.do")
	public String update(Model model, HttpServletRequest request) throws Exception{
    	int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        
        TestVo testVo = testService.selectDetail(bbsID);
        model.addAttribute("update", testVo);
		
        List<Map<String, Object>> fileList = testService.selectFileList(testVo.getBbsID());
		model.addAttribute("file", fileList);
		
		return "test/update";
	}
    
    // 게시글 수정 완료
    @RequestMapping(value="/updateTest.do", method = RequestMethod.POST)
    public String updateTest(TestVo testVo,
    		@RequestParam(value="fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
    	
        testService.updateTest(testVo, files, fileNames, mpRequest);
        return "redirect:testDetail.do?bbsID="+testVo.getBbsID();
    }
    
    // 게시글 삭제 완료
    @RequestMapping(value="/deleteTest.do")
    public String deleteTest(HttpServletRequest request) throws Exception {
        int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        testService.deleteTest(bbsID);
        return "redirect:testList.do";
    }

}