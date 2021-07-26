package egovframework.example.test.controller;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

@Controller
public class TestController {
    
    @Autowired
    private TestService testService;
    
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
    public String login(){
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
		
		return "redirect:main.do";
	}
    
    // 로그아웃
    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
	
		return "redirect:main.do";
	}
    
    // 회원가입 페이지
    @RequestMapping(value="/join.do")
    public String join(){
        return "test/join";
    }
    
    // 회원가입 하기
    @RequestMapping(value="/register.do")
    public String register(@ModelAttribute("userVo") UserVo userVo) throws Exception {
        testService.register(userVo);
        return "redirect:main.do";
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
        
        return "test/testList";
    }

    // 게시글 읽기
    @RequestMapping(value="/testDetail.do")
    public String viewForm(Model model, HttpServletRequest request) throws Exception{
    	
        int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        
        TestVo testVo = testService.selectDetail(bbsID);
        model.addAttribute("vo", testVo);
        
        return "test/testDetail";
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
		
		return "test/update";
	}
    
    // 게시글 수정 완료
    @RequestMapping(value="/updateTest.do")
    public String updateTest(@ModelAttribute("testVo") TestVo testVo) throws Exception {
        testService.updateTest(testVo);
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