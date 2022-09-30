package com.myspring.market;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.domain.CategoryVO;
import com.myspring.domain.PagingVO;
import com.myspring.domain.ProductVO;
import com.myspring.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService adminService;
	
	@GetMapping("/prodForm")
	public String prodRegister(Model m) {
		List<CategoryVO> cgList=this.adminService.getCategoryList();
		logger.info("cgList={}",cgList);
		
		m.addAttribute("cgList",cgList);
		return "admin/prodForm";
	}
	
	@PostMapping("/prodForm")
	public String productRegisterProcess(Model m,
			@RequestParam("mpimage") List<MultipartFile> mpimage,
			@ModelAttribute("item") ProductVO item,
			HttpServletRequest req
			) {
		logger.info("item={}",item);
		logger.info("mpimage={}",mpimage);
		
		
		ServletContext app=req.getServletContext();
		String UP_DIR=app.getRealPath("/resources/images");
		logger.info("UP_DIR={}",UP_DIR);
		
		if(!mpimage.isEmpty()) { 
			for(int i=0;i<mpimage.size();i++) {
				MultipartFile mf=mpimage.get(i);
				try {
					mf.transferTo(new File(UP_DIR, mf.getOriginalFilename()));
					if(i==0) {
						item.setPimage1(mf.getOriginalFilename());
					}else if(i==1) {
						item.setPimage2(mf.getOriginalFilename());
					}else if(i==2) {
						item.setPimage3(mf.getOriginalFilename());
					}
				} catch(Exception e) {
					//logger.info("파일업로드 에러 : {}",e);
				}
			}
		}
		
		int n = this.adminService.productInsert(item);
		
		String str=(n>0)?"상품등록 성공":"상품등록 실패";
		String loc=(n>0)?"prodList":"javascript:history.back()";
		
		m.addAttribute("msg",str);
		m.addAttribute("loc",loc);
		
		return "msg";
	}
	
	@GetMapping("/prodList")
	public String productList(Model m, HttpServletRequest req,
			@ModelAttribute("page") PagingVO page) {
		
		int totalCount=this.adminService.getFindTotalCount(page);
		page.setTotalCount(totalCount);
		page.setPageSize(5);
		page.setPagingBlock(5);
		////////
		page.init();
		////////
		
		List<ProductVO> prodArr=adminService.productList(page);
		m.addAttribute("prodArr",prodArr);
		m.addAttribute("page",page);
		return "admin/prodList";
		
	}
	
	@GetMapping("/prodEdit")
	public String prodEdit(Model m, @RequestParam(defaultValue="0") int pnum) {
		if(pnum==0) {
			return "redirect:prodList()";
		}
		List<CategoryVO> cgList=this.adminService.getCategoryList();

		ProductVO prod=adminService.selectByPnum(pnum);
		
		m.addAttribute("cgList",cgList);
		m.addAttribute("prod",prod);
		m.addAttribute("cg_num",prod.getCg_num());
		
		return "admin/prodEdit";
	}
	
	@PostMapping("/editForm")
	public String prodEditProdcess(Model m,
			@RequestParam("mpimage") List<MultipartFile> mpimage,
			@ModelAttribute("item") ProductVO item,
			HttpServletRequest req) {
		
		logger.info("item={}",item);
		logger.info("mpimage={}",mpimage);
		
		ServletContext app=req.getServletContext();
		String UP_DIR=app.getRealPath("/resources/images");
		logger.info("UP_DIR={}",UP_DIR);
		
		if(!mpimage.isEmpty()) { 
			for(int i=0;i<mpimage.size();i++) {
				MultipartFile mf=mpimage.get(i);
				try {
					mf.transferTo(new File(UP_DIR, mf.getOriginalFilename()));
					if(i==0) {
						item.setPimage1(mf.getOriginalFilename());
					}else if(i==1) {
						item.setPimage2(mf.getOriginalFilename());
					}else if(i==2) {
						item.setPimage3(mf.getOriginalFilename());
					}
				} catch(Exception e) {
					//logger.info("파일업로드 에러 : {}",e);
				}
			}
		}
		
		int n = this.adminService.productEdit(item);
		
		String str=(n>0)?"상품수정 성공":"상품수정 실패";
		String loc=(n>0)?"prodList":"javascript:history.back()";
		
		m.addAttribute("msg",str);
		m.addAttribute("loc",loc);
		
		return "msg";
	}
	
	@GetMapping("/prodDel")
	public String prodDelete(Model m, @RequestParam(defaultValue="0") int pnum) {
		if(pnum==0) {
			return "redirect:prodList()";
		}
		
		int n=this.adminService.productDel(pnum);
		
		String str=(n>0)?"상품삭제 성공":"상품삭제 실패";
		String loc=(n>0)?"prodList":"javascript:history.back()";
		
		m.addAttribute("msg",str);
		m.addAttribute("loc",loc);
		
		return "msg";
	}
}
