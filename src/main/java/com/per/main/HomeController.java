package com.per.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.per.main.board.BoardDTO;
import com.per.main.board.ticketopen.TicketOpenService;
import com.per.main.book.BookService;
import com.per.main.pay.product.ProductDTO;
import com.per.main.pay.product.ProductService;
import com.per.main.per.PerformanceDTO;
import com.per.main.per.PerformanceService;
import com.per.utils.Pager;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	PerformanceService performanceService;	
	@Autowired
	TicketOpenService ticketOpenService;	
	@Autowired
	BookService bookService;
	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/")
	public String home(Pager pager, Model model) throws Exception{
		//공연리스트 
		List<PerformanceDTO> ar = performanceService.getMainList();
		//티켓오픈리스트
		List<BoardDTO> ar2 = ticketOpenService.getList(pager);
		//예매순위리스트
		List<PerformanceDTO> ar3 = bookService.getRank();
		//상품리스트
		List<ProductDTO> ar4 = productService.getGiftList(pager);
		
		
		model.addAttribute("perList", ar);
		model.addAttribute("openList",ar2);
		model.addAttribute("rankList", ar3);
		model.addAttribute("mdList",ar4);
		
		return "index";
	}
	
	@RequestMapping("/admin")
	public String admin() throws Exception{
		return "indexAdmin";
	}
	
}
