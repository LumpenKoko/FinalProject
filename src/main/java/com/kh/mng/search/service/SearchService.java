package com.kh.mng.search.service;

import java.util.ArrayList;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.search.model.dto.SearchFilter;

public interface SearchService {
	// 검색 페이지 총 조회 결과 개수
	int selectLocationListCount();
	
	// 장소 키워드로 검색
	ArrayList<Location> selectSearchLocationList(String keyword, PageInfo pi);
	
	// 키워드 가지고 필터링 해서 장소 검색
	ArrayList<Location> selectFilterLocationList(SearchFilter sf, PageInfo pi);
	
	// 사용자 찜하기
	int insertUserPick(PickedInfo pick);
	
	// 사용자 찜 삭제
	int deleteUserPick(PickedInfo pick);
}
 