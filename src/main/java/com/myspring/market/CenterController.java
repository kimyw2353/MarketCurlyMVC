package com.myspring.market;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.domain.CenterVO;
import com.myspring.service.CenterService;

@Controller
@RequestMapping("/customer")
public class CenterController {

	private static final Logger logger = LoggerFactory.getLogger(CenterController.class);

	@Inject
	CenterService service;

	// 글 작성 get
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(Model m, CenterVO vo) throws Exception {
		logger.info("get write");
	}

	// 글 작성 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(Model m, 
	         HttpServletRequest req,
	         @RequestParam("mfilename") MultipartFile mfilename,
	         @ModelAttribute("center") CenterVO vo) throws Exception {
		logger.info("post write {}");

		service.write(vo);

		//return "redirect:/";
		return "customer/list";
	}
	
	//글 목록
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
		logger.info("get list");
	
		List<CenterVO> list = service.list();
		
		model.addAttribute("list", list);
	}

}
