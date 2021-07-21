package egovframework.example.test.controller;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVo;

@Controller
public class TestController {
    
    @Autowired
    private TestService testService;
    
    
    //글목록페이지
    @RequestMapping(value="/testList.do")
    public String testListDo(TestVo testVo, Model model) throws Exception{
        
        model.addAttribute("list", testService.selectTest(testVo));
        
        return "test/testList";
    }
    
    //글 상세페이지
    @RequestMapping(value="testDetail.do")
    public String viewForm(Model model, HttpServletRequest request) throws Exception{
        int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        
        TestVo testVo = testService.selectDetail(bbsID);
        model.addAttribute("vo", testVo);
        
        return "test/testDetail";
    }
    
    //글작성페이지
    @RequestMapping(value="/testRegister.do")
    public String testRegister(){
        return "test/testRegister";
    }
    
    //글쓰기
    @RequestMapping(value="/insertTest.do")
    public String write(@ModelAttribute("testVo") TestVo testVo) throws Exception {
        testService.insertTest(testVo);
        return "redirect:testList.do";
    }
    
    //글수정
    @RequestMapping(value="/updateTest.do")
    public String updateTest(@ModelAttribute("testVo") TestVo testVo) throws Exception {
        testService.updateTest(testVo);
        return "redirect:testDetail.do?bbsID="+testVo.getBbsID();
    }
    
    //글삭제
    @RequestMapping(value="/deleteTest.do")
    public String deleteTest(HttpServletRequest request) throws Exception {
        int bbsID = Integer.parseInt(request.getParameter("bbsID"));
        testService.deleteTest(bbsID);
        return "redirect:testList.do";
    }

}