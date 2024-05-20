package com.kh.mng.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {
	
	@RequestMapping("search.pl")
	public String searchForm() {
		return "search/searchPage";
	}
	
	@RequestMapping("test")
	public String test() {
		return "bosspage/bossCouponPage";
	}
}
