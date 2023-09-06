package com.per.main.board.ticketopen;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.per.main.board.BoardDAO;
import com.per.main.board.BoardDTO;
import com.per.utils.Pager;

@Repository
public class TicketOpenDAO implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.per.main.board.ticketopen.TicketOpenDAO.";
	
	public TicketOpenFileDTO getFileDetail(TicketOpenFileDTO ticketOpenFileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", ticketOpenFileDTO);
	}
	
	public int setFileDelete(TicketOpenFileDTO ticketOpenFileDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setFileDelete", ticketOpenFileDTO);
	}
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getDetail", boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setAdd", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public Long getTotal(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}

	@Override
	public int setHitUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int setFileAdd(TicketOpenFileDTO ticketOpenFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setFileAdd", ticketOpenFileDTO);
	}

}
