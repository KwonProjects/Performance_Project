package com.per.main.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.per.main.board.BoardDTO;
import com.per.main.book.PerformanceOrderDTO;
import com.per.utils.Pager;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.per.main.member.MemberDAO.";

	public List<MemberDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public List<MemberDTO> getAdminList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getAdminList", pager);
	}
	public Long getTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotal",pager);
	}
	
	public Long getAdminTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getAdminTotal",pager);
	}
	
	public int setJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setJoin", memberDTO);
	}
	
	public int setKakaoJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setKakaoJoin", memberDTO);
	}
	
	public int setNaverJoin(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setNaverJoin", memberDTO);
	}

	public MemberDTO getId(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getId", memberDTO);
	}

	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getLogin", memberDTO);
	}
	
	//마이페이지에서 수정
	public int setUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE + "setUpdate", memberDTO);
	}
	
	public MemberDTO findEmail(String email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "findEmail", email);
	}

	
	//회원삭제
	public int setDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setDelete", memberDTO);
	}
	
	//admin에서 회원수정
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setMemberUpdate", memberDTO);
	}
	//admin회원수정
	public int setAdminUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setAdminUpdate", memberDTO);
	}

	//회원상세
	public MemberDTO getDetail(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getDetail", memberDTO);
	}
	
	//회원등록
	public int setAdminAdd(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAdminAdd", memberDTO);
	}
	
	//회원예매내역
		public List<PerformanceOrderDTO> getMyBookList(String id) throws Exception {
		    return sqlSession.selectList(NAMESPACE + "getMyBookList", id);
		}
	//회원예매취소
		 public int deleteBook(String orderNum) throws Exception {
			 System.out.println("DAO: " + orderNum);
		    return sqlSession.delete(NAMESPACE + "deleteBook", orderNum);
		}

		public MemberDTO getUserInfo(MemberDTO memberDTO) throws Exception {
			return sqlSession.selectOne(NAMESPACE+"getUserInfo", memberDTO);
		}
	
	

}