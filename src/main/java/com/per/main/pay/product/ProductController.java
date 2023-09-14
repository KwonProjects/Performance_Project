package com.per.main.pay.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.per.main.member.MemberDTO;
import com.per.main.member.MemberService;

import com.per.utils.Pager;


@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/product/giftShop", method = RequestMethod.GET)
	public ModelAndView getGiftList(ModelAndView mv, Pager pager) throws Exception {
		List<ProductDTO> list = productService.getGiftList(pager);
		mv.addObject("giftList", list);
		mv.addObject("pager", pager);
		mv.setViewName("product/giftShop");
		return mv;
	}
	
	@RequestMapping(value = "/admin/product/giftShop", method = RequestMethod.GET)
	public ModelAndView getAdminGiftList(ModelAndView mv, Pager pager) throws Exception {
		List<ProductDTO> list = productService.getGiftList(pager);
		mv.addObject("giftList", list);
		mv.addObject("pager", pager);
		mv.setViewName("product/adminGiftShop");
		return mv;
	}




	@RequestMapping(value = "/product/giftDetail", method = RequestMethod.GET)
	public ModelAndView getGiftDetail(ProductDTO productDTO, ModelAndView mv, MemberDTO memberDTO, HttpSession session) throws Exception {
		productDTO = productService.getGiftDetail(productDTO);
		mv.addObject("giftDetail", productDTO);
		mv.addObject("member", memberDTO);
		mv.setViewName("product/giftDetail");

		return mv;
	}
	
	@RequestMapping(value = "/admin/product/giftDetail", method = RequestMethod.GET)
	public ModelAndView getAdminGiftDetail(ProductDTO productDTO, ModelAndView mv) throws Exception {
		productDTO = productService.getGiftDetail(productDTO);
		mv.addObject("giftDetail", productDTO);
		mv.setViewName("product/adminGiftDetail");

		return mv;
	}
	
	@RequestMapping(value = "/admin/product/update", method = RequestMethod.GET)
	public String setUpdate(ProductDTO productDTO, Model model)throws Exception{
		productDTO = productService.getGiftDetail(productDTO);
		model.addAttribute("giftDetail", productDTO);
		return "product/adminGiftUpdate";
	}
	
	@RequestMapping(value = "/admin/product/update", method = RequestMethod.POST)
	public String setUpdate(ProductDTO productDTO)throws Exception{
		int result = productService.setUpdate(productDTO);
		return "redirect:./giftShop";
	}
	
	@RequestMapping(value = "/admin/product/delete", method = RequestMethod.GET)
	public String setAdd(ProductDTO productDTO)throws Exception{
		int result = productService.setDelete(productDTO);
		return "redirect:./giftShop";
	}

}
