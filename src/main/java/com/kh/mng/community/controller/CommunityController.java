package com.kh.mng.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mng.community.service.CommunityService;
import com.kh.mng.community.service.CommunityServiceImpl;
import com.kh.mng.pet.model.vo.Pet;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@RequestMapping("/community")
	public String communityMain(Pet p, HttpSession session, Model model) {
		
		int listCount = new CommunityServiceImpl().selectListCount();
		
		return "community/communityMain";
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
