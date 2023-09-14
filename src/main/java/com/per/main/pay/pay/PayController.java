package com.per.main.pay.pay;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.per.main.member.MemberDTO;
import com.per.main.member.MemberService;
import com.per.main.pay.cart.CartDTO;
import com.per.main.pay.cart.CartService;
import com.per.main.pay.product.ProductDTO;
import com.per.main.pay.product.ProductVO;
import com.per.utils.IamPortKey;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	private IamportClient api;

	@Autowired
	private MemberService memberService;

	@Autowired
	private PayService payService;

	@Autowired
	private CartService cartService;

	public PayController() {
		// REST API 키와 REST API secret 입력.
		IamPortKey key = new IamPortKey();
		this.api = new IamportClient(key.getAPIKey(), key.getAPISecret());

	}

	@ResponseBody
	@RequestMapping(value = "buycart", method = RequestMethod.POST)
	public ModelAndView buyCart(@ModelAttribute MemberDTO memberDTO, HttpSession session, ModelAndView mv)
			throws Exception {

		System.out.println("들어옴.");
		memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO = (MemberDTO) memberService.getUserInfo(memberDTO);
		System.out.println("member : " + memberDTO);
		List<CartDTO> list = cartService.cartlist(memberDTO);
		//System.out.println(list.get(0).toString());

		mv.addObject("member", memberDTO);
		mv.addObject("gfitList", list);

		mv.setViewName("pay/payment2");
		return mv;
	}

	@RequestMapping(value = "buygift", method = RequestMethod.POST)
	public ModelAndView payGiftMotion(MemberDTO memberDTO, @ModelAttribute ProductVO payProductDTO, HttpSession session,
			ModelAndView mv) throws Exception {
		memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO = (MemberDTO) memberService.getUserInfo(memberDTO);
		System.out.println(memberDTO.toString());
		if (memberDTO != null) {
			mv.addObject("member", memberDTO);
			mv.addObject("gift", payProductDTO);
			System.out.println("price :" + payProductDTO.getP_Name());
			System.out.println("price :" + payProductDTO.getP_Total());
			System.out.println("memberDTO :" + memberDTO.getMember_num());

		}

		System.out.println(memberDTO.toString());
		System.out.println(payProductDTO.toString());
		mv.setViewName("pay/payment");
		return mv;
	}

	@GetMapping("deleteorder")
	public String cancelOrder(ProductOrderDTO productOrderDTO) throws Exception {
		int resultRemoveData;
		productOrderDTO = payService.orderDetail(productOrderDTO);
		System.out.println("취소 : " + productOrderDTO.toString());
		resultRemoveData = payService.removeOrder(productOrderDTO);

		if (resultRemoveData > 0) {
			System.out.println("DB 삭제성공");
		}
		return "redirect:../product/giftDetail?p_Num=" + productOrderDTO.getP_Num();
	}

	@GetMapping("buygiftinfo")
	public String openProcessing(ProductOrderDTO productOrderDTO, Model model, HttpSession session) throws Exception {
		System.out.println("get mapping");

		productOrderDTO = payService.orderDetail(productOrderDTO);
		System.out.println(productOrderDTO.toString());
		model.addAttribute("orderDetail", productOrderDTO);

		return "pay/buygiftinfo";
	}

	@ResponseBody
	@PostMapping("done")
	public boolean paycomplete(MemberDTO memberDTO, @ModelAttribute ProductOrderDTO productOrderDTO,
			HttpSession session, Model model) throws Exception {

		boolean result = true;
		System.out.println("/pay/done in");
		memberDTO = (MemberDTO) session.getAttribute("member");
		if (memberDTO != null) {
			model.addAttribute("member", memberDTO);
		}

		String imp_uid = productOrderDTO.getImp_uid();

		System.out.println("test imp_uid : " + imp_uid);

		String token = payService.getToken();

		System.out.println("test token : " + token);
		memberDTO = (MemberDTO) memberService.getUserInfo(memberDTO);
		productOrderDTO.setMemberNum(memberDTO.getMember_num());

		String amount = payService.paymentInfo(productOrderDTO.getImp_uid(), token);

		System.out.println("test amount : " + amount);

		System.out.println("test amountType : " + amount.getClass().getName());

		System.out.println("test totalPrice : " + productOrderDTO.getTotalPrice());

		System.out.println("after productOrderDTO" + productOrderDTO.toString());

		if (productOrderDTO.getTotalPrice() != Long.parseLong(amount)) {
			// 결제 취소
			// payService.canclePay(orderDTO.getImp_uid(),token,amount,"결제 취th");
			result = false;
		}

		payService.insertPayData(productOrderDTO);
//		payService.buyProduct(productOrderDTO);
		System.out.println(result);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid, HttpServletRequest request)
			throws IamportResponseException, IOException {
		System.out.println("step 1");

		IamportResponse<Payment> paymentIamportResponse = api.paymentByImpUid(imp_uid);
		Payment payment = paymentIamportResponse.getResponse();
		session = request.getSession(false);
		session.setAttribute("payment", payment);
		session.setMaxInactiveInterval(600);
		return paymentIamportResponse;
	}

}
