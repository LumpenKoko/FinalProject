package com.kh.mng.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.mng.community.model.vo.TotalShortsInfo;
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
	@GetMapping(value="getVideo.sh")
	public String loadShorts(@RequestParam(value="videoId") int videoId) {
		TotalShortsInfo totalShortsInfo = new TotalShortsInfo();
		
		totalShortsInfo = communityService.getVideoInfo(videoId);
		
		int shortsNum = totalShortsInfo.getShortsNo();
		
		totalShortsInfo.setLikeCount(communityService.getVideoLikeCount(shortsNum));
		totalShortsInfo.setReplyCount(communityService.getVideoReplyCount(shortsNum));
		
		return new Gson().toJson(totalShortsInfo);
	 }
	
	@ResponseBody
	@GetMapping(value="addComment.sh", produces="application/text; charset=utf-8")
	public String addComment(@RequestParam(value="comment") String comment) {
		if (communityService.addComment(comment) > 0) {
			return comment;
		} else {
			return null;
		}
	}
}
