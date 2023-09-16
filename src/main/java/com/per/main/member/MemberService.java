package com.per.main.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.per.main.board.BoardDTO;
import com.per.main.book.PerformanceOrderDTO;
import com.per.utils.Pager;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public List<MemberDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(memberDAO.getTotal(pager));		
		return memberDAO.getList(pager);
	}
	
	public List<MemberDTO> getAdminList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(memberDAO.getAdminTotal(pager));
		return memberDAO.getAdminList(pager);
	}
	
	public int setJoin(MemberDTO memberDTO)throws Exception{
		return memberDAO.setJoin(memberDTO);
	}	
	
	public int setKakaoJoin(MemberDTO memberDTO)throws Exception{
		return memberDAO.setKakaoJoin(memberDTO);
	}
	
	public int setNaverJoin(MemberDTO memberDTO)throws Exception{
		return memberDAO.setNaverJoin(memberDTO);
	}
	
	public MemberDTO getId(MemberDTO memberDTO)throws Exception{
		return memberDAO.getId(memberDTO);
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO)throws Exception{
		return memberDAO.getLogin(memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setUpdate(memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setMemberUpdate(memberDTO);
	}
	
	public MemberDTO findEmail(String email)throws Exception{
		return memberDAO.findEmail(email);
	}
	
	public void logout(String access_token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	   
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_token);
	        
	        int responseCode = conn.getResponseCode();

	        System.out.println("responseCode : " + responseCode);
	        System.out.println(access_token);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	//�쉶�썝,�뼱�뱶誘� �궘�젣 (DELETETYPE �뾽�뜲�씠�듃 �삎�떇)
	public int setDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.setDelete(memberDTO);
	}	
	

	//�쉶�썝 �긽�꽭
	public MemberDTO getDetail(MemberDTO memberDTO) throws Exception {
		return memberDAO.getDetail(memberDTO);
	}
	
	
	//�뼱�뱶誘� �벑濡�
	public int setAdminAdd(MemberDTO memberDTO) throws Exception {
		return memberDAO.setAdminAdd(memberDTO);
	}
	
	//�뼱�뱶誘� �닔�젙
	public int setAdminUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setAdminUpdate(memberDTO);
	}
	
	// �삁留ㅻ궡�뿭
	public List<PerformanceOrderDTO> getMyBookList(String id) throws Exception {
		return memberDAO.getMyBookList(id);
	}

	// �삁留ㅼ랬�냼
	public int deleteBook(String orderNum) throws Exception {
		System.out.println("Service: " + orderNum);
		return memberDAO.deleteBook(orderNum);
	}

	public MemberDTO getUserInfo(MemberDTO memberDTO)throws Exception {
		return memberDAO.getUserInfo(memberDTO);
	}

	
	
}