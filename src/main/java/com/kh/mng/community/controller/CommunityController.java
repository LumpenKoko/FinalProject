package com.kh.mng.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	@RequestMapping(value="community.bo")
	public String communityMain() {
		return "community/boardMain";
	}
	
	@RequestMapping(value="shortsView.bo")
	public String detailShortsView() {
		return "community/shortsShow";
	}
	
	@RequestMapping(value="detailView.bo")
	public String detailBoardView() {
		return "community/boardContent";
	}
	
	@RequestMapping(value="enrollShorts.bo")
	public String enrollShorts() {
		return "community/shortsEnroll";
	}
	
	@RequestMapping(value="enrollBoard.bo")
	public String enrollBoard() {
		return "community/writingPage";
	}
}
