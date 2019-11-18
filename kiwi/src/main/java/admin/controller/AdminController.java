package admin.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.AdminVO;
import common.service.KiwiService;
import common.util.CommonUtil;
import member.model.NotMemberException;

@Controller
public class AdminController {
	@Autowired
	private KiwiService kiwi;
	
	@Autowired
	private CommonUtil util;

	@RequestMapping(value="/adminlogin.do", method=RequestMethod.GET)
	public String adminlogin(){
		return "login/adminlogin";
	}
	
	@RequestMapping(value="/adminLoginEnd.do", method=RequestMethod.POST)
	public String adminLoginEnd(Model model, HttpSession ses,
			@RequestParam(defaultValue="") String aemail,
			@RequestParam(defaultValue="") String apwd) 
					throws NotMemberException{
			//1.유효성 체크
			if(aemail.isEmpty()||apwd.isEmpty()){
				return "redirect:/kiwi/home.do";
			}
			String msg="", loc="";
			
			//2. 로그인 인증 처리 메소드 호출
			AdminVO loginAdmin=kiwi.isAdminLoginOK(aemail,apwd);
			
			if(loginAdmin!=null){
				// 제대로 회원 인증을 받았다면 세션에 로그인한 회원 정보를 저장하자.
				ses.setAttribute("loginAdmin",loginAdmin);
				return "kiwi/home";
			}
			
			return "kiwi/home";
	}//-----------------
	
	@RequestMapping("/admin/adminLogout.do")
	public String adminLogout(HttpSession ses){
		ses.invalidate();
		return "redirect:/kiwi/home.do";
	}//-----------------
		
	
	@ExceptionHandler(NotMemberException.class)
	public String exceptionHandler(Exception ex){
		//error처리 페이지에서는 page지시어에
		//isErrorPage="true"값을 지정하여
		//exception 내장 객체를 사용할 수 있도록 한다.
		
		//예외 처리를 위한 뷰 네임을 반환한다.
		return "login/errorAlert";
	}
	
	
	@RequestMapping(value="/admin/adminemailCheck.do",method=RequestMethod.POST)
	public @ResponseBody int adminemailCheck(
			HttpServletResponse res,@RequestParam(defaultValue="")String aemail){
		res.setHeader("Cache-Control", "no-cache");
		int n = kiwi.adminEmailCheck(aemail.trim());
		return n;
	}
	
	@RequestMapping("/admin/common/msg.do")
	public String showMsg(){
		return "memo/message";
	}
	
	@RequestMapping("/admin/adminmain.do")
	public void adminmain(){
		
	}
	
	@RequestMapping("/admin/admindetail.do")
	public void admindetail(){
		
	}
	
}
