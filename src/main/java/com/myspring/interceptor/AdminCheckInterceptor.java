package com.myspring.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspring.domain.MemberVO;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse response, Object handler)
			throws Exception {
		//session을 얻어옴
		HttpSession ses=req.getSession();
		//로그인 유저 정보 얻어옴
		MemberVO user=(MemberVO)ses.getAttribute("loginUser");
		if(user!=null) {
			if(user.getUserid().equals("admin")) return true;
			//관리자가 맞다면 true반환
			else {
				String loc=req.getContextPath()+"/";
				req.setAttribute("msg", "관리자만 이용 가능합니다.");
				req.setAttribute("loc", loc);
				
				RequestDispatcher disp=req.getRequestDispatcher("/WEB-INF/views/msg.jsp");
				//서버 내에서 이동하는 것이기 때문에 절대경로로 적어준다
				disp.forward(req, response);
			}
		}
		return false;//관리자가 아니라면 false반환
	}
	
	

}
