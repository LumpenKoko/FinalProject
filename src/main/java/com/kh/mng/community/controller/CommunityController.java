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
import com.kh.mng.community.model.dto.BoardInfo;
import com.kh.mng.community.model.dto.BoardPage;
import com.kh.mng.community.model.dto.ShortPage;
import com.kh.mng.community.model.vo.BoardCategory;
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
			@RequestParam(value="boardPageNo",defaultValue="1") int boardPageNo, 
			@RequestParam(value="boardCategoryNo",defaultValue="0") int boardCategoryNo,
			@RequestParam(value="boardContent",defaultValue="default") String boardContent,
			Model model) {
		
		System.out.println(shortsPageNo);
		System.out.println("BoardNo:"+boardPageNo);
		//쇼츠 목록 가져오기
		int shortsCount=communityService.selectShortsCount();
		PageInfo shortsPi =Pagination.getPageInfo(shortsCount,shortsPageNo,10,10);
		ArrayList<Shorts> shorts =communityService.selectShortsList(shortsPi);
		
	
		//게시판 목록 가져오기
		BoardInfo boardInfo=new BoardInfo();
		boardInfo.setBoardCategoryNo(boardCategoryNo);
		boardInfo.setBoardContent(boardContent);
		 
		int boardCount=communityService.selectBoardCount(boardInfo);
		PageInfo boardPi =Pagination.getPageInfo(boardCount,boardPageNo,10,10);
		ArrayList<CommunityBoard> boards = communityService.selectBoardList(boardPi,boardInfo);

		//카테고리 목록 가져오기
		ArrayList<BoardCategory> boardCategory=communityService.selectBoardCategoryList();
		
	
		model.addAttribute("shorts",shorts);
		model.addAttribute("shortsPi",shortsPi);
		
		model.addAttribute("boards",boards);
		model.addAttribute("boardPi",boardPi);
		
		model.addAttribute("boardCategory",boardCategory);
		
		
		return "community/communityMain";
	}
	
	//게시판 페이징처리 비동기
	@ResponseBody
	@GetMapping(value="boards", produces="application/json; charset:utf-8")
	public String selectBoards(@RequestParam(value="boardCategoryNo",defaultValue="0")int boardCategoryNo
			                  ,@RequestParam(value="boardPageNo",defaultValue="1")  int boardPageNo,
			                   @RequestParam(value="boardContent",defaultValue="default") String boardContent
			                    ) {
		 
		
		//게시판 목록 가져오기
		BoardInfo boardInfo=new BoardInfo();
		boardInfo.setBoardCategoryNo(boardCategoryNo);
		boardInfo.setBoardContent(boardContent);
		int boardCount=communityService.selectBoardCount(boardInfo);
		PageInfo boardPi =Pagination.getPageInfo(boardCount,boardPageNo,10,10);
		ArrayList<CommunityBoard> boards = communityService.selectBoardList(boardPi,boardInfo);
		
		BoardPage pages = new BoardPage();
		pages.setPage(boardPi);
		pages.setBoards(boards);
		
		return new Gson().toJson(pages);
		
	}
	
	//게시글 카테고리 별 처리 비동기
	@ResponseBody
	@GetMapping(value="category", produces="application/json; charset:utf-8")
	public String categoryBoard(@RequestParam(value="boardCategoryNo",defaultValue="0")int boardCategoryNo,
			                  @RequestParam(value="boardContent",defaultValue="default") String boardContent) {
		System.out.println("boardCategoryNo"+boardCategoryNo);
		BoardInfo boardInfo=new BoardInfo();
		boardInfo.setBoardCategoryNo(boardCategoryNo);
		boardInfo.setBoardContent(boardContent);
		
		int boardCount=communityService.selectBoardCount( boardInfo);
		PageInfo boardPi =Pagination.getPageInfo(boardCount,1,10,10);
		ArrayList<CommunityBoard> boards = communityService.selectBoardList(boardPi,  boardInfo);
		BoardPage pages = new BoardPage();
		pages.setPage(boardPi);
		pages.setBoards(boards);
		return new Gson().toJson(pages);
	}
	
	//게시글 검색 비동기 처리
	
	@ResponseBody
	@GetMapping(value="search", produces="application/json; charset:utf-8")
	public String searchBoard(@RequestParam(value="boardCategoryNo",defaultValue="0")int boardCategoryNo,
			                  @RequestParam(value="boardContent",defaultValue="default") String boardContent) {
		System.out.println("boardCategoryNo"+boardCategoryNo);
		System.out.println(boardContent);
		BoardInfo boardInfo=new BoardInfo();
		boardInfo.setBoardCategoryNo(boardCategoryNo);
		boardInfo.setBoardContent(boardContent);
		
		int boardCount=communityService.selectBoardCount( boardInfo);
		PageInfo boardPi =Pagination.getPageInfo(boardCount,1,10,10);
		ArrayList<CommunityBoard> boards = communityService.selectBoardList(boardPi,  boardInfo);
		BoardPage pages = new BoardPage();
		pages.setPage(boardPi);
		pages.setBoards(boards);
		return new Gson().toJson(pages);
	}
	
	
	//쇼츠 페이징 처리 비동기
		@ResponseBody
		@GetMapping(value="shorts", produces="application/json; charset:utf-8")
		public String selecShorts(int shortsPageNo) {
			System.out.println(shortsPageNo);
			int shortsCount=communityService.selectShortsCount();
			
			PageInfo shortsPi =Pagination.getPageInfo(shortsCount,shortsPageNo,10,10);
			ArrayList<Shorts> shorts =communityService.selectShortsList(shortsPi);
			ShortPage pages=new ShortPage();
			pages.setPage(shortsPi);
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
	public String addComment(@RequestParam(value="userNo, videoId, comment") int userNo, int videoId, String comment) {
		
		int shortsNum = communityService.getShortsNum(videoId);
		
		if (communityService.addComment(userNo, shortsNum, comment) > 0) {
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
