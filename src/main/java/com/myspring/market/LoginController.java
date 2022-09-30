package com.myspring.market;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.myspring.domain.MemberVO;
import com.myspring.service.MemberService;

@Controller
public class LoginController {
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	MemberService memberService;
	
	@GetMapping("/login")
	public String login(){
		
		return "member/login";
	}
	
	
	@PostMapping("/login")
	public String loginEnd(HttpSession ses, Model m, @ModelAttribute("member") MemberVO member) {
		logger.info("member={}", member);
		
		
		MemberVO loginUser =  this.memberService.loginCheck(member);
		if(loginUser!=null) {
			ses.setAttribute("loginUser", loginUser);
		}else {
			String str= "로그인 실패";
		    String loc= "javascript:history.back()";
			
		    m.addAttribute("msg",str);
		    m.addAttribute("loc",loc);
			
		    return "msg";
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logOut(Model m, HttpSession ses) {
	ses.invalidate();
		
		return "redirect:/";		
	}
	
}


