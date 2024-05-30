package com.kh.mng.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mng.community.service.CommunityService;
import com.kh.mng.community.service.CommunityServiceImpl;
import com.kh.mng.location.model.dto.ReviewInfo;

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
