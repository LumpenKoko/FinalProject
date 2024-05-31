package com.kh.mng.search.service;

import java.util.ArrayList;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.location.model.vo.Location;

public interface SearchService {
	// 검색 페이지 총 조회 결과 개수
	int selectLocationListCount();
	
	// 검색 페이지 장소 
	ArrayList<Location> selectSearchLocationList(String keyword, PageInfo pi);
}
 