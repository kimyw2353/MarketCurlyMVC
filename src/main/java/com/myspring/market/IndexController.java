package com.myspring.market;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	//SYSOUT �Ⱦ��� �α׸� ���� �� ����Ѵ�.
	//���丮�����̴�
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
