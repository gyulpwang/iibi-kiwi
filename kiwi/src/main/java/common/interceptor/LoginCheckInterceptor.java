package common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import common.util.CommonUtil;
import member.model.MemberVO;

/* Interceptor
 * 	- 컨트롤러가 실행되기 전에 사전 처리할 작업이 있다면 인터셉터로 구현하자.
 * 	  (#1은 두 방법 중 하나를 선택)
 * #1. Interceptor가 되기 위해서는
 * 		[1] HandlerInterceptor 인터페이스를 상속받는다.	=> 추상 메소드 3개를 모두 오버라이드 해야 함.
 * 		[2] HandlerInterceptorAdapter 추상 클래스를 상속받는다.	=> 필요한 메소드만 오버라이드 한다.
 * #2. mvc-config.xml에 인터셉터를 등록하고 매핑 정보를 설정한다.
	<!-- mvc-config.xml에 인터셉터를 등록 ============================= -->
	<mvc:interceptors>
		<mvc:interceptor>
			<mvc:mapping path="/user/**"/>
			<bean class="common.interceptor.LoginCheckInterceptor"/>
		</mvc:interceptor>
	</mvc:interceptors>
	<!-- ============================================================== -->
 * */
public class LoginCheckInterceptor implements HandlerInterceptor{

	private final Logger log = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Autowired
	private CommonUtil util;
	
	/* 컨트롤러(핸들러)를 실행하기 전에 호출됨. 여기서 로그인 여부를 체크하자. */
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		
		log.debug("preHandle() 호출됨 >>> ");
		
		HttpSession ses = req.getSession();
		MemberVO loginMember = (MemberVO)ses.getAttribute("loginMember");
		
		if(loginMember == null){
			
			// 로그인하지 않았다면
			String msg = "로그인해야 이용할 수 있어요";
			String loc = req.getContextPath()+"/kiwi/home.do";

			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			log.debug("loc={}",loc);
			RequestDispatcher dis = req.getRequestDispatcher("/common/msg.do");
			dis.forward(req, res);	// 페이지 이동 : WEB-INF/view/memo/message.jsp			

			
			/*res.sendRedirect(loc);*/
			
			return false;	// false를 반환하면 컨트롤러 수행이 안된다.
		}
		return true;
	}			

	/* 컨트롤러(핸들러) 실행 후 아직 뷰를 실행하기 전에 호출됨 */
	public void postHandle
	(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		log.debug("postHandle() 호출됨 >>> ");
	}

	/* 뷰를 실행한 후에 호출되는 메소드 */
	public void afterCompletion
	(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		log.debug("afterCompletion() 호출됨 >>> ");
	}
}
