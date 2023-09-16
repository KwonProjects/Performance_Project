package com.per.main.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.per.utils.Pager;

@Repository
public class PerformanceDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.per.main.per.PerformanceDAO.";
	
	
	public Long getPlayTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPlayTotal", pager);
	}
	
	public List<PerformanceDTO> getPlayList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getPlayList", pager);
	}
	
	public List<PerformanceDTO> getMainPlayList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getMainPlayList");
	}
	
	public Long getMusicalTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getMusicalTotal", pager);
	}
	
	public List<PerformanceDTO> getMusicalList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getMusicalList", pager);
	}
	
	public PerformancePlaceDTO getDetail(PerformanceDTO performanceDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getDetail", performanceDTO);
	}
	
	//------------------------------
	
	//공연 삭제
	public int setPerDelete(PerformanceDTO performanceDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setPerDelete", performanceDTO);
	}
	//공연시설 삭제
	public int setPlaceDelete(PerformancePlaceDTO placeDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setPlaceDelete", placeDTO);
	}
	
	//공연 상세정보
	public PerformanceDTO getPerDetail(PerformanceDTO performanceDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPerDetail", performanceDTO);
	}
	//공연시설 상세정보
	public PerformancePlaceDTO getPlaceDetail(PerformancePlaceDTO placeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPlaceDetail", placeDTO);
	}
	
	//공연 리스트
	public List<PerformanceDTO> getPerList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getPerList", pager);
	}
	//공연시설 리스트
	public List<PerformancePlaceDTO> getPlaceList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getPlaceList", pager);
	}
	
	public Long getPerTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPerTotal", pager);	
	}
	
	public Long getPlaceTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPlaceTotal", pager);	
	}
	
	//공연 등록 및 업데이트
	public int setPerInfo(PerformanceDTO performanceDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setPerInfo", performanceDTO);
	}
	//공연시설 등록 및 업데이트
	public int setPlaceInfo(PerformancePlaceDTO placeDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setPlaceInfo", placeDTO);
	}
	
	

}
