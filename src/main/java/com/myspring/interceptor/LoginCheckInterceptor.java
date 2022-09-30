package com.myspring.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.domain.MemberVO;

//HandlerInterceptor�������̽��� �����ϴ� ��� <=�̰� ����Ұ���
//HandlerInterceptorAdapter �߻�Ŭ������ �����ϴ� ���
/* Interceptor
 *  - ��Ʈ�ѷ��� ����Ǳ� ���� ���� ó���� ���� ������ 
 *    ������������ ���ͼ��Ϳ��� �����Ѵ�.
 *  - ���� ���
 *  1. ���ͼ��� ����
 *     [1] HandlerInterceptor�������̽��� ��ӹ޴� ���
 *     [2] HandlerInterceptorAdapter �߻�Ŭ������ ��ӹ޴� ���
 *      
 *  2. ���ͼ��� ��� => servlet-context.xml���� ����ϰ� ���� ������ ����
 *  <!-- Interceptor���� =========================================================== -->
   <interceptors>
         <interceptor>
            <mapping path="/user/**"/>
            <mapping path="/admin/**"/>
            <beans:bean class="com.myspring.interceptor.LoginCheckInterceptor"/>
         </interceptor>
   </interceptors>
 * */


public class LoginCheckInterceptor implements HandlerInterceptor{
	
	Logger logger=LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	
	//��Ʈ�ѷ��� �����ϱ� ���� ȣ��Ǵ� �޼ҵ� : preHandler�����ڵ鷯
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle()");
		HttpSession ses=request.getSession();
		MemberVO user=(MemberVO)ses.getAttribute("loginUser");
		if(user!=null) return true; //true�� ��ȯ�ϸ� ��Ʈ�ѷ��� �̵���
			//��ȯŸ���� boolean 
		String loc=request.getContextPath()+"/login";
		request.setAttribute("msg", "�α����ؾ� �̿� �����մϴ�.");
		request.setAttribute("loc", loc);
		
		RequestDispatcher disp=request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
		//���� ������ �̵��ϴ� ���̱� ������ �����η� �����ش�
		disp.forward(request, response);
		return false;
		//false�� ��ȯ�ϸ� ��Ʈ�ѷ��� ���� ���Ѵ�
	}
	
	//��Ʈ�ѷ� ���� �� view�� �����ϱ� �� ȣ��Ǵ� �޼ҵ� : postHandler
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("postHandle()");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	//view�� ������ �Ŀ� ȣ��Ǵ� �޼ҵ�
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("afterHandle()");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
