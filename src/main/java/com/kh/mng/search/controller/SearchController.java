package com.kh.mng.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.common.model.vo.Pagination;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.search.service.SearchServiceImpl;

@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImpl searchService;
	
	@GetMapping("search.pl")
	public String searchForm() {
		return "search/searchPage";
	}
	
	@GetMapping("searchKeyword.pl")
	public String searchKeyword(@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, Model model) {
		/*
		 * 검색 시 필요한 데이터
		 * - 현재 페이지 값
		 * - 검색한 키워드
		 * - 필터링 항목
		 * - 정렬 기준
		 * 
		 * - 헤더 검색 시 필터링 결과, 키워드 결과는 남아 있어야 함
		 * 
		 */
//		int locationCount = searchService.selectLocationListCount();
//		PageInfo pi = Pagination.getPageInfo(locationCount, currentPage, 10, 10);
//		ArrayList<Location> list = searchService.selectLocationList();
//		
		return "search/searchPage";
	}
	
	@RequestMapping("test")
	public String test() {
		return "bosspage/bossCouponPage";
	}
}
