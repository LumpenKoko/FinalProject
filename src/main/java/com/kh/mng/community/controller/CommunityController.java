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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.common.model.vo.Pagination;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.community.service.CommunityService;
import com.kh.mng.community.service.CommunityServiceImpl;
import com.kh.mng.location.model.dto.ReviewInfo;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/community")
	public String communityMain(@RequestParam(value="spaceNo",defaultValue="1") int pageNo,  Model model) {
		
		System.out.println(pageNo);
		//쇼츠 목록 가져오기
		int shortsCount=communityService.selectShortsCount();
		
		PageInfo pi =Pagination.getPageInfo(shortsCount,pageNo,10,10);
		ArrayList<Shorts> shorts =communityService.selectShortsList(pi);
		
		System.out.println(shorts);
		//게시글 목록 가져오기
		model.addAttribute("shorts",shorts);
		model.addAttribute("communityPi",pi);
		
		return "community/communityMain";
	}
	
	//페이징 처리 비동기
	
	
	
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
	@RequestMapping(value="getVideo.sh")
	public String loadShorts(@RequestParam(value="videoId") int videoId) {
//		communityService.getVideo(videoId); // 임시로 url만 가져옴
		return "resources/video/test.mp4";
	 }
	
	@ResponseBody
	@RequestMapping(value="addComment.sh", produces="application/text;charset=utf-8")
	public String addComment(@RequestParam(value="comment") String comment) {
		/*
		if (communityService.addComment(comment) > 0) {
			return comment;
		} else {
			return null; // 임시용(나중에 null로 바꿔야함)
		}
		*/
		return comment;
	}
}
