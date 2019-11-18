package common.interceptor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import admin.model.AdminVO;

public class AdminCheckInterceptor 
		extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req,
			HttpServletResponse res,
			Object handler) throws ServletException, IOException{
		HttpSession ses=req.getSession();
		AdminVO loginAdmin
		=(AdminVO)ses.getAttribute("loginAdmin");
		//로그인하지 않았거나, 로그인을 했더라도
		//관리자(admin)가 아니라면
		if(loginAdmin==null|| 
				! loginAdmin.getAemail().equals("admin")){
			String msg="관리자만 이용 가능합니다.";
			String loc="javascript:history.back()";
			req.setAttribute("msg",msg);
			req.setAttribute("loc",loc);
			RequestDispatcher dis
			=req.getRequestDispatcher("/common/msg.do");
			dis.forward(req,res);
			return false;
		}//if---------------------
		return true;
	}//---------------------------------

}///////////////////////////////////////






