package com.kh.mng.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mng.community.service.CommunityService;
import com.kh.mng.community.service.CommunityServiceImpl;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("/community")
	public String communityMain() {
		return "community/communityMain";
	}
	
	@RequestMapping(value="shortsView.bo")
	public String detailShortsView() {
		new CommunityServiceImpl().selectListCount();
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
	
	@ResponseBody
	@RequestMapping(value="addComment.sh")
	public String addComment(@RequestParam(value="comment") String comment) {
		if (communityService.addComment() > 0) {
			return comment;
		} else {
			return comment; // 임시용(나중에 null로 바꿔야함)
		}
		
	}
}
