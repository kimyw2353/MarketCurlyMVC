package com.myspring.market;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	//SYSOUT 안쓰고 로그를 남길 때 사용한다.
	//팩토리패턴이다
	private static final Logger logger 
	= LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/top")
	public void showTop() {
	}
	@RequestMapping("/carousel")
	public void showCarousel() {
	}
	@RequestMapping("/rec")
	public void showRec() {
	}
	@RequestMapping("/foot")
	public void showFoot() {
	}
	

}
