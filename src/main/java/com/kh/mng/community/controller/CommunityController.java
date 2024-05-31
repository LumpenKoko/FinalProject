package com.kh.mng.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.common.model.vo.Pagination;
import com.kh.mng.community.model.dto.ShortPage;
import com.kh.mng.community.model.vo.CommunityBoard;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.community.model.vo.ShortsReply;
import com.google.gson.Gson;
import com.kh.mng.community.model.vo.TotalShortsInfo;
import com.kh.mng.community.service.CommunityService;
import com.kh.mng.community.service.CommunityServiceImpl;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/community")
	public String communityMain(@RequestParam(value="shortsPageNo",defaultValue="1") int shortsPageNo,  
			@RequestParam(value="boardPage",defaultValue="1") int boardPage, Model model) {
		
		System.out.println(shortsPageNo);
		//쇼츠 목록 가져오기
		int shortsCount=communityService.selectShortsCount();
		PageInfo shortsPi =Pagination.getPageInfo(shortsCount,shortsPageNo,10,10);
		ArrayList<Shorts> shorts =communityService.selectShortsList(shortsPi);
		
		//게시판 목록 가져오기
		int boardCount=communityService.selectBoardCount();
		PageInfo boardPi =Pagination.getPageInfo(boardCount,boardPage,10,10);
		ArrayList<CommunityBoard> boards = communityService.selectBoardList(boardPi);
		
		System.out.println(boards);
		System.out.println(boardPi);
	
		model.addAttribute("shorts",shorts);
		model.addAttribute("communityPi",shortsPi);
		
		
		
		return "community/communityMain";
	}
	
	//페이징 처리 비동기
	@ResponseBody
	@GetMapping(value="shorts", produces="application/json; charset:utf-8")
	public String getShorts(int pageNo) {
		System.out.println(pageNo);
		int shortsCount=communityService.selectShortsCount();
		
		PageInfo pi =Pagination.getPageInfo(shortsCount,pageNo,10,10);
		ArrayList<Shorts> shorts =communityService.selectShortsList(pi);
		ShortPage pages=new ShortPage();
		pages.setPage(pi);
		pages.setShorts(shorts);
		
		return new Gson().toJson(pages);
		
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
	public String addComment(@RequestParam(value="videoId, comment") int videoId, String comment) {
		if (communityService.addComment(videoId, comment) > 0) {
			return comment;
		} else {
			return null;
		}
	}
	
	@ResponseBody
	@GetMapping(value="loadReply.sh", produces="application/json; charset=utf-8")
	public String loadReply(@RequestParam(value="num") int videoId){
		TotalShortsInfo totalShortsInfo = new TotalShortsInfo();
		
		totalShortsInfo = communityService.getVideoInfo(videoId);
		
		int shortsNum = totalShortsInfo.getShortsNo();
		
		ArrayList<ShortsReply> replyList = new ArrayList<ShortsReply>();
		replyList = communityService.loadReply(shortsNum);
		return new Gson().toJson(replyList);
	}
}
