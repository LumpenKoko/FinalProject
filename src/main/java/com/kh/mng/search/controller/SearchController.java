package com.kh.mng.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mng.location.model.vo.detail.Location;
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
	public ModelAndView searchKeyword(String keyword, ModelAndView mv) {
//		ArrayList<Location> list = searchService.selectLocationList();

		mv.setViewName("search/searchPage");
		return mv;
	}
	
	@RequestMapping("test")
	public String test() {
		return "bosspage/bossCouponPage";
	}
}
