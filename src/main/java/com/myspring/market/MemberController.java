package com.myspring.market;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.domain.MemberVO;
import com.myspring.service.MemberService;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/join")
	public String join() {
		
		return "member/join";
	}
	
	@PostMapping("/joinAdd")
	public String joinProcess(Model m, @ModelAttribute("member") MemberVO member) {
		logger.info("member={}", member);
		
		int n=this.memberService.memberInsert(member);
	      
	    String str=(n>0)?"회원가입 성공":"회원가입 실패";
	    String loc=(n>0)?"/market":"javascript:history.back()";
		
	    m.addAttribute("msg",str);
	    m.addAttribute("loc",loc);
		
		return "msg";
	}
	
	@GetMapping("/idCheck")
	public String idCheck(@RequestParam(defaultValue="") String userid) {
		
		
		return "member/idCheckForm";
	}
	
	@PostMapping("/idCheck")
	public String idCheckResult(Model m, @RequestParam(defaultValue="") String userid) {
		if(userid.isEmpty()) {
			//return util.addMsgBack("아이디를 입력하세요")
		}
		MemberVO id = memberService.findMemberByUserid(userid);
		if(id==null) {
			m.addAttribute("result", "ok");
		}else {
			m.addAttribute("result", "fail");
		}
		m.addAttribute("userid", userid);
		
		
		return "/member/idCheckResult";
	}
	
}




