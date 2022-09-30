package com.myspring.market;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.myspring.domain.MemberVO;

@Controller
public class IdCheckController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@PostMapping("/idcheck")
	public String idCheck(@ModelAttribute("member") MemberVO member) {
		logger.info("member={}", member);
		
		return "";
	}
	
}





