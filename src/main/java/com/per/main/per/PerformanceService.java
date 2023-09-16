package com.per.main.per;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.per.main.book.BookDAO;
import com.per.utils.Pager;

@Service
public class PerformanceService {
	@Autowired
	private PerformanceDAO performanceDAO;
	private PerformanceApi api = new PerformanceApi();
	
	public List<PerformanceDTO> getMainList() throws Exception {
		return performanceDAO.getMainPlayList();
	}
	
	public List<PerformanceDTO> getPlayList(Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = performanceDAO.getPlayTotal(pager);
		pager.makePageNum(total);
		
		return performanceDAO.getPlayList(pager);
	}
	
	public List<PerformanceDTO> getMusicalList(Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = performanceDAO.getMusicalTotal(pager);
		pager.makePageNum(total);
		
		return performanceDAO.getMusicalList(pager);
	}
	
	public PerformancePlaceDTO getDetail(PerformanceDTO performanceDTO) throws Exception {
		return performanceDAO.getDetail(performanceDTO);
	}
	
	//------------------------------
	
	//공연 삭제
	public int setPerDelete(PerformanceDTO performanceDTO) throws Exception {
		return performanceDAO.setPerDelete(performanceDTO);
	}
	//공연시설 삭제
	public int setPlaceDelete(PerformancePlaceDTO placeDTO) throws Exception {
		return performanceDAO.setPlaceDelete(placeDTO);
	}
	
	//공연 상세정보
	public PerformanceDTO getPerDetail(PerformanceDTO performanceDTO) throws Exception {
		return performanceDAO.getPerDetail(performanceDTO);
	}
	//공연시설 상세정보
	public PerformancePlaceDTO getPlaceDetail(PerformancePlaceDTO placeDTO) throws Exception {
		return performanceDAO.getPlaceDetail(placeDTO);
	}
	
	//공연 리스트
	public List<PerformanceDTO> getPerList(Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = performanceDAO.getPerTotal(pager);
		pager.makePageNum(total);
		
		return performanceDAO.getPerList(pager);
	}
	//공연시설 리스트
	public List<PerformancePlaceDTO> getPlaceList(Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = performanceDAO.getPlaceTotal(pager);
		pager.makePageNum(total);
		
		return performanceDAO.getPlaceList(pager);
	}
	
	//공연 등록
	public int setPerInfo() throws Exception {		
		int count = 0;
		
		List<PerformanceDTO> perList = api.getPerList(2);
		
		for(int i=0; i<perList.size(); i++) {
			String id = perList.get(i).getMt20id();
			PerformanceDTO performanceDTO = api.getPerDetail(id); 
//			System.out.println(performanceDTO.getMt20id());
			int result = performanceDAO.setPerInfo(performanceDTO);
			count += result;
		}
		System.out.println(count);
		return count;
	}
	//공연시설 등록 
	public int setPlaceInfo() throws Exception {
		int count = 0;
		
		List<PerformancePlaceDTO> placeList = api.getPlaceList(2);
	
		for(int i=0; i<placeList.size(); i++) {
			String id = placeList.get(i).getMt10id();
			PerformancePlaceDTO placeDTO = api.getPlaceDetail(id);	
			int result = performanceDAO.setPlaceInfo(placeDTO);
			count += result;
		}
		System.out.println(count);
		return count;
	}




	

	
}
