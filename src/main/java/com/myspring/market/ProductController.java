package com.myspring.market;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.domain.ProductVO;
import com.myspring.service.ShopService;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	private ShopService shopService;

//	@GetMapping("/rec")
//	public String productByPspec(Model m, @RequestParam(name = "pspec", defaultValue = "rec") String pspec) {
//		logger.info("pspec={}", pspec);
//		List<ProductVO> plist = shopService.selectByPspec(pspec);
//		logger.info("plist={}", plist);
//		m.addAttribute("plist", plist);
//		m.addAttribute("pspec", pspec);
//
//		return "shop/rec";
//	}

	// pspec(HIT,NEW, BEST) ���� ��ǰ��� ��������
	@GetMapping("/prodPspec")
	public String productByPspec(Model m, @RequestParam(name = "pspec", defaultValue = "rec") String pspec) {
		logger.info("pspec={}", pspec);

		List<ProductVO> plist = shopService.selectByPspec(pspec);
		

		logger.info("plist={}", plist);
		m.addAttribute("plist", plist);
		m.addAttribute("pspec", pspec);
		
		if(pspec.equals("rec")) {
			return "shop/rec";
		}else if(pspec.equals("BEST")) {
			return "best/best";
		}else if(pspec.equals("NEW")) {
			return "best/best";
		}

		return "shop/rec";
		// "/WEB-INF/views/shop/mallHit.jsp"
	}

	@GetMapping("/prodDetail")
	public String productDetail(Model m, @RequestParam(defaultValue = "0") int pnum) {
		logger.info("pnum={}", pnum);
		if (pnum == 0) {
			// ��ȿ��üũ
			return "";
		}
		// ��ǰ��ȣ�� ��ǰ ��������
		ProductVO prod = shopService.selectByPnum(pnum);
		logger.info("prod={}", prod);

		// �𵨿� �����ϱ� => key�� => "item"
		m.addAttribute("item", prod);

		return "shop/prodDetail";
	}

}
