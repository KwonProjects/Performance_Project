package com.per.main.member;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpConnection;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.per.main.book.PerformanceOrderDTO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

   @Autowired
   private MemberService memberService;
   @Autowired
   private MailSendService mailService;
   @Autowired
   private JavaMailSender mailSender;
   

   // naverapi
   private NaverLoginBO naverLoginBO;
   // kakaoapi
   private KakaoLoginBO kakaoLoginBO;
   private String apiResult = null;

   
   @Autowired
   private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }
   
   @Autowired
   private void setKakaoLoginBO(KakaoLoginBO kakaoLoginBO) {
      this.kakaoLoginBO = kakaoLoginBO;
   }

   @RequestMapping(value = "join", method = RequestMethod.GET)
   public void setJoin() throws Exception {

   }

   @RequestMapping(value = "join", method = RequestMethod.POST)
   public String setJoin(MemberDTO memberDTO) throws Exception {
      int result = memberService.setJoin(memberDTO);

      return "redirect:../";
   }

   //id 중복확인
   @RequestMapping(value = "idCheck", method = RequestMethod.GET)
   public String getId(MemberDTO memberDTO, Model model) throws Exception {
      memberDTO = memberService.getId(memberDTO);

      int result = 0;

      //id없음
      if (memberDTO == null) {
         result = 1;
      }

      model.addAttribute("result", result);

      return "commons/ajaxResult";
   }
       
    //mypage
    @RequestMapping(value="mypage", method= RequestMethod.GET)
    public void getMyPage() throws Exception{
   
    }
    
    //update
    @RequestMapping(value="memberUpdate", method=RequestMethod.GET)
    public void setUpdate() throws Exception{
       
    }
   
    //update
    @RequestMapping(value="memberUpdate", method=RequestMethod.POST)
    public String setUpdate(MemberDTO memberDTO, HttpSession session) throws Exception{
       MemberDTO sessionMember = (MemberDTO)session.getAttribute("member");
       memberDTO.setId(sessionMember.getId());
       int result = memberService.setUpdate(memberDTO);
       if(result>0) {
          session.setAttribute("member", memberDTO);
       }
       
       return "redirect:./mypage";
    }
   
    //로그인
   @RequestMapping(value = "userLogin", method = RequestMethod.GET)
   public String getLogin(Model model, HttpSession session) throws Exception {
      
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      model.addAttribute("urlNaver", naverAuthUrl);
      
      String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
      model.addAttribute("urlKakao", kakaoAuthUrl);
      
      return "member/login";
   }

    //login
    @RequestMapping(value = "userLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
       memberDTO = memberService.getLogin(memberDTO);
       
       Map<String, Object> result = new HashMap<String, Object>();
       if (memberDTO != null) {
          session.setAttribute("member", memberDTO);
          result.put("type", "성공");
          result.put("msg", "[안내] 로그인 성공");
          result.put("role", memberDTO.getRole());
       } else {
          result.put("type", "실패");
          result.put("msg", "[안내] 로그인 실패");
       }
       
       return result;
    }

   // 네이버 로그인 성공시 callback호출 메소드
   @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
         throws Exception {

      System.out.println("여기는 naver callback");
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);

      // 1. 로그인 사용자 정보를 읽어온다.
      apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

      // 2. String형식인 apiResult를 json형태로 바꿈
      JSONParser parser = new JSONParser();
      Object obj = parser.parse(apiResult);
      JSONObject jsonObj = (JSONObject) obj;
      System.out.println(jsonObj);

      // 3. 데이터 파싱
      // Top레벨 단계 _response 파싱
      JSONObject response_obj = (JSONObject) jsonObj.get("response");
      // response의 birtyear값 파싱
      System.out.println(response_obj);
      
      String birthyear = (String) response_obj.get("birthyear");
      String email = (String) response_obj.get("email");
      String name = (String) response_obj.get("name");
		/*
		 * String email = (String) response_obj.get("email"); String birthyear =
		 * (String) response_obj.get("birthyear");
		 */

      System.out.println(birthyear);
      System.out.println(email);
      System.out.println(name);
      
      //email있는지 조회 
      MemberDTO memberDTO = memberService.findEmail(email);
      
      if(memberDTO != null) {
          System.out.println("네이버 가입된 이메일이 있다");
          memberService.getLogin(memberDTO);
          session.setAttribute("member", memberDTO);
          
          return "redirect:../";
       }else {
          System.out.println("네이버 가입된 이메일 없다");
          session.setAttribute("name", name);
          session.setAttribute("email", email);
         
          return "member/naverJoin";
       }      
      }
   
	   //네이버 회원가입
	   @RequestMapping(value="naverJoin", method=RequestMethod.GET)
	   public void setNaverJoin()throws Exception{
	      
	   }
	   
	   //네이버 회원가입
	   @RequestMapping(value="naverJoin", method=RequestMethod.POST)
	   public String setNaverJoin(MemberDTO memberDTO,HttpSession session)throws Exception{
	       System.out.println("여기는 네이버 join");
	 	  memberService.setNaverJoin(memberDTO);
	      session.setAttribute("member", memberDTO);
	      
	      return "redirect:../";
	   }
   
   
      
      //카카오 회원가입
      @RequestMapping(value="kakaoJoin", method=RequestMethod.GET)
      public void setKakaoJoin()throws Exception{
         
      }
      
      //카카오 회원가입
      @RequestMapping(value="kakaoJoin", method=RequestMethod.POST)
      public String setKakaoJoin(MemberDTO memberDTO,HttpSession session)throws Exception{
          System.out.println("여기는 카카오 join");
    	  memberService.setKakaoJoin(memberDTO);
         session.setAttribute("member", memberDTO);
         
         return "redirect:../";
      }
   
   
      // 카카오 로그인 성공시 callback호출 메소드
      @RequestMapping(value = "/callbackKakao", method = { RequestMethod.GET, RequestMethod.POST })
      public String callbackKakao( @RequestParam String code, @RequestParam String state, HttpSession session, ModelAndView mv)
            throws Exception {

         System.out.println("로그인 성공  callbackKakao");
         System.out.println("session names = "+session.getAttributeNames());
         System.out.println("session = "+session);
         System.out.println("code = "+code);
         System.out.println("state = "+state);
         System.out.println("-------bo getaccess전------");
         OAuth2AccessToken oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
         System.out.println("oauthToken = "+oauthToken);
         
         // 1. 로그인 사용자 정보를 읽어온다.
         apiResult = kakaoLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
         System.out.println("apiResult = "+apiResult);
      
         // 2. String형식인 apiResult를 json형태로 바꿈
         JSONParser jsonParser = new JSONParser();
         JSONObject jsonObj;
         
         jsonObj = (JSONObject) jsonParser.parse(apiResult);
         System.out.println("jsonObj = "+jsonObj);
      
         // 3. 데이터 파싱
         // Top레벨 단계 _response 파싱
         JSONObject response_obj = (JSONObject)jsonObj.get("kakao_account");   
         JSONObject response_obj2 = (JSONObject)response_obj.get("profile");      
         
         String email = (String)response_obj.get("email");
         String name = (String)response_obj2.get("nickname");
         System.out.println("email = "+email);
         System.out.println("name = "+name);
         
         //email있는지 조회 
         MemberDTO memberDTO = memberService.findEmail(email);
         
                  
         if(memberDTO != null) {
            System.out.println("가입된 이메일이 있다");
            memberService.getLogin(memberDTO);
            session.setAttribute("member", memberDTO);
            session.setAttribute("access_token", oauthToken.getAccessToken());
            return "redirect:../";
         }else {
            System.out.println("가입된 이메일 없다");
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("access_token", oauthToken);
            return "member/kakaoJoin";
         }

      }
   
   @RequestMapping("/loginSuccess")
   public String loginSuccess() {
         return "loginSuccess";
   }

   @RequestMapping(value = "logout", method = RequestMethod.GET)
   public String getLogout(HttpSession session) throws Exception {
       System.out.println("logout access_token ="+session.getAttribute("access_token"));

       	if (session.getAttribute("access_token") != null) {
       		memberService.logout((String)session.getAttribute("access_token")); }

       	session.invalidate();
   
      return "redirect:../";
   }

   //본인확인 인증메일
   @RequestMapping(value = "mailCheck", method = RequestMethod.GET)
   @ResponseBody
   public String mailCheck(String email) {
      System.out.println("이메일 인증 요청이 들어옴");
      System.out.println("이메일 인증 이메일 : " + email);
      return mailService.joinEmail(email); //MailSendService에있는 joinEmail
   }   


	@RequestMapping(value="/memberOrder", method = RequestMethod.GET )
	public void getMemberOrder() {
			
	}
	
	@RequestMapping(value="agree", method = RequestMethod.GET)
	public void getMemberAgree() throws Exception{
			
	}
	
		// 예매내역	
	  @RequestMapping(value="/memberBook", method = RequestMethod.GET)
	   public ModelAndView memberBook(@RequestParam(value = "id", required = false) String id) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      List<PerformanceOrderDTO> myBook = memberService.getMyBookList(id);
	      mv.addObject("memberBook", myBook);
	      mv.setViewName("member/memberBook");
	      return mv;
	   }

	   // 예매취소하기

	   @RequestMapping(value = "deleteBook", method = RequestMethod.GET)
	   public String deleteBook(@RequestParam("orderNum") String orderNum, HttpSession session) throws Exception {
	       System.out.println(orderNum);
	       int result = memberService.deleteBook(orderNum);

	       // 세션에서 member 정보를 가져와 member.id 값을 사용
	       MemberDTO member = (MemberDTO) session.getAttribute("member");
	       if (member != null) {
	           return "redirect:/member/memberBook?id=" + member.getId();
	       } else {
	           return "redirect:/"; // member 정보가 없는 경우 홈페이지로 리다이렉션
	       }
	   }
}