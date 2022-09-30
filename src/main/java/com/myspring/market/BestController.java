package com.myspring.market;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BestController {
	private static final Logger logger 
	= LoggerFactory.getLogger(BestController.class);
	//로그 남길 때 사용

	@GetMapping("/best")
	public String showBest(Model m) {
		m.addAttribute("pspec", "Best");
		return "best/bestmain";
	}
	@GetMapping("new")
	public String showNew(Model m) {
		m.addAttribute("psepc", "New");
		return "best/newmain";
	}
	

}
