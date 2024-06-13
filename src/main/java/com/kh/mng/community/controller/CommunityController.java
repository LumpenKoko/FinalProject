package com.kh.mng.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.common.model.vo.Pagination;
import com.kh.mng.community.model.dto.BoardGoodInfo;
import com.kh.mng.community.model.dto.BoardInfo;
import com.kh.mng.community.model.dto.BoardPage;
import com.kh.mng.community.model.dto.BoardReplyInfo;
import com.kh.mng.community.model.dto.ReplyInfo;
import com.kh.mng.community.model.dto.ShorstInfo;
import com.kh.mng.community.model.dto.ShortPage;
import com.kh.mng.community.model.dto.ShortsFileInfo;
import com.kh.mng.community.model.vo.BoardCategory;
import com.kh.mng.community.model.vo.BoardReply;
import com.kh.mng.community.model.vo.CommunityBoard;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.community.model.vo.ShortsReply;
import com.kh.mng.community.model.vo.TotalShortsInfo;
import com.kh.mng.community.service.CommunityService;
import com.kh.mng.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;



@Slf4j
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
	@GetMapping(value="boards", produces="application/json; charset=utf-8")
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
	@GetMapping(value="category", produces="application/json; charset=utf-8")
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
	@GetMapping(value="search", produces="application/json; charset=utf-8")
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
	@GetMapping(value = "shorts", produces = "application/json; charset=utf-8")
	public String selecShorts(int shortsPageNo) {
		System.out.println(shortsPageNo);
		int shortsCount = communityService.selectShortsCount();

		PageInfo shortsPi = Pagination.getPageInfo(shortsCount, shortsPageNo, 10, 10);
		ArrayList<Shorts> shorts = communityService.selectShortsList(shortsPi);
		ShortPage pages = new ShortPage();
		pages.setPage(shortsPi);
		pages.setShorts(shorts);

		return new Gson().toJson(pages);

	}
	
	@GetMapping(value="enrollshort.view")
	public String enrollShortsView() {
		
		return "community/shortsEnroll";
	}
	

	//쇼츠 등록
	@PostMapping(value = "/enroll.short")
	public String enrollShorts(List<MultipartFile> files , ShorstInfo shortsInfo, HttpSession session,Model model) {
		
	   log.info("files:");
	   log.info("text:"+shortsInfo.getShortsContent());
	   System.out.println(files);
	   System.out.println(shortsInfo.getShortsContent());
	   System.out.println(shortsInfo.getShowRange());
	   
	   Member loginMember=(Member)(session.getAttribute("loginUser"));
	   shortsInfo.setUserNo(loginMember.getUserNo());
	
	   Map<String,ShortsFileInfo>fileInfos= new HashMap<String,ShortsFileInfo>();
	   
	   String filePath="resources/img/user/etc";
	   
	   if(files!=null) {
		   
		   for(MultipartFile f:files) {
			   
			   if(f.getContentType().contains("image")) {
				   filePath="resources/video/thumnail/";
			   }
			   else {
				   filePath="resources/video/mp4/";
			   }
			   
			   String changeName= saveFile(f,session,filePath);
			   ShortsFileInfo filesInfo=new  ShortsFileInfo();
			   filesInfo.setOriginName(f.getOriginalFilename());
			   filesInfo.setChangeName(changeName);
			   filesInfo.setFilePath(filePath);
			   fileInfos.put(f.getContentType(),filesInfo);
		   }
	   }
	 
	  int count= communityService.insertShorts(fileInfos,shortsInfo);
	  if(count>0) {
		  session.setAttribute("alertMsg","쇼츠가 등록되었습니다.");
	  }else {
		  session.setAttribute("alertMsg", "쇼츠 등록에 실패하셨습니다.");
	  }
		
	   return "redirect:/community";
	}

	private String saveFile(MultipartFile upfile, HttpSession session, String path) {
		// 파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
		String originName = upfile.getOriginalFilename();

		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		// 5자리 랜덤값
		int ranNum = (int) (Math.random() * 90000) + 10000;

		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));

		// 수정된 첨부파일명
		String changeName = currentTime + ranNum + ext;

		// 첨부파일을 저장할 폴더의 물리적 경로(session)
		String savePath = session.getServletContext().getRealPath(path);
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName;

	}
	
	
	@GetMapping(value="shortsView.bo")
	public String detailShortsView() {
		return "community/shortsShow";
	}
	
	//커뮤니티 게시판 상세 컨트롤러
	@GetMapping(value="detailView.bo")
	public String detailBoardView(@RequestParam(value="bno") int bno,
								  @RequestParam(value="pageNo",defaultValue="1") int pageNo,
								  Model model) {
		
		
		int  replyCount= communityService.selectBoardReplyCount(bno);
	    PageInfo replyPi = Pagination.getPageInfo(replyCount ,pageNo, 10, 10);
		
		 CommunityBoard communityBoard = communityService.selectBoardDetail(replyPi,bno);
		 
		 log.info("communityBoard:{}",communityBoard);
		 
		
		 model.addAttribute("board",communityBoard);
		 model.addAttribute("replyPi",replyPi);
		 
		 return "community/boardContent";
	}
	
	//댓글 대댓글 입력 컨트롤러
	@ResponseBody
	@PostMapping(value="detailViewReply.in")
	public String detailInsertReply(ReplyInfo replyInfo,HttpSession session) {
		
		int userNo=((Member)session.getAttribute("loginUser")).getUserNo();
		replyInfo.setUserNo(userNo);
		
		log.info("응답:{}",replyInfo);
		
		int count = communityService.insertBoardReply(replyInfo);
		
		if(count>0) {
			return "ok";
		}else{
			return "fail";
		}
		
	}
	
	//댓글정보 비동기로가져오는 컨트롤러
	@ResponseBody
	@GetMapping(value="detailViewReply.view", produces = "application/json; charset=utf-8")
	public String detailReplyView(ReplyInfo replyInfo,  HttpSession session) {
		
		//댓글개수만 가져와야된다. (답글x)
		int  replyCount= communityService.selectBoardReplyCount(replyInfo.getBoardNo());

		
		PageInfo replyPi = Pagination.getPageInfo(replyCount ,replyInfo.getPageNo(), 10, 10);
		ArrayList<BoardReply> replys =  communityService.selectBoardReplys(replyPi,replyInfo);
		
		BoardReplyInfo boardReplyInfo =new BoardReplyInfo();
		boardReplyInfo.setPage(replyPi);
		boardReplyInfo.setReplys(replys);
		
		log.info("{}",boardReplyInfo.getReplys());
		log.info("{}",boardReplyInfo.getPage());
		
		return new Gson().toJson(boardReplyInfo);
		
	}
	
	@ResponseBody
	@GetMapping(value="updategoodcount.bo",produces = "application/json; charset=utf-8")
	public String updateBoardGood(BoardInfo boardInfo,HttpSession session) {
		
		int userNo=((Member)session.getAttribute("loginUser")).getUserNo();
		boardInfo.setUserNo(userNo);
		
		
	    BoardGoodInfo goodInfo=communityService.updateBoardGoodCount(boardInfo);
		
		return new Gson().toJson(goodInfo);
		
		
	}
	
	
	 
	
	
	@GetMapping(value="enrollBoard.bo")
	public String enrollBoard() {
		return "community/writingPage";
	}
	
	@ResponseBody
	@GetMapping(value="getVideo.sh")
	public String loadShorts(@RequestParam(value="videoId") int videoId) {

	    TotalShortsInfo totalShortsInfo = communityService.getVideoInfo(videoId);

	    if (totalShortsInfo == null) {
	        return "Error: Video info not found.";
	    } else {
	        int shortsNum = totalShortsInfo.getShortsNo();
	        totalShortsInfo.setLikeCount(communityService.getVideoLikeCount(shortsNum));
	        totalShortsInfo.setReplyCount(communityService.getVideoReplyCount(shortsNum));
	        return new Gson().toJson(totalShortsInfo);
	    }
	}

	
	@ResponseBody
	@GetMapping(value="addComment.sh", produces="application/json; charset=utf-8")
	public String addComment(@RequestParam(value="userNo") int userNo, 
				            @RequestParam(value="num") int videoId, 
				            @RequestParam(value="comment") String comment) {
		
		log.info("userNo:" + userNo);
		log.info("num:" + videoId);
		log.info("comment:" + comment);
		
		int shortsNo = communityService.getShortsNum(videoId);
		
		log.info("shortsNum:" + shortsNo);
		
		ShortsReply shortsReply = communityService.addComment(userNo, shortsNo, comment);
		return new Gson().toJson(shortsReply);
	}
	
	@ResponseBody
	@GetMapping(value="loadReply.sh", produces="application/json; charset=utf-8")
	public String loadReply(@RequestParam(value="num") int videoId){
		int shortsNum = communityService.getShortsNum(videoId);
		
		ArrayList<ShortsReply> replyList = communityService.loadReply(shortsNum);
		return new Gson().toJson(replyList);
	}
}
