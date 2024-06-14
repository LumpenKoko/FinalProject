package com.kh.mng.location.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.mng.common.chat.model.vo.Chat;
import com.kh.mng.common.chat.model.vo.MasterInfo;
import com.kh.mng.common.chat.model.vo.UserInfo;
import com.kh.mng.common.chat.service.ChatService;
import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.common.model.vo.Pagination;
import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.dto.ReplyInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.dto.ReviewPage;
import com.kh.mng.location.model.vo.DetailLocationAttachment;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.Review;
import com.kh.mng.location.service.LocationService;
import com.kh.mng.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

import com.kh.mng.location.model.vo.DetailLocation; 


@Controller
@Slf4j
public class LocationController {

	private final LocationService detailService;
	private final ChatService chatService;
	
	
//	@GetMapping("/chat")
//	public String ChatList(int locationNo,Model model,HttpSession session) {
//		log.info("{}",locationNo);
//		
//		Member connectedUser =((Member)session.getAttribute("loginUser"));
//		session.setAttribute("connectedUser", connectedUser);
//		
//		//사장님 아이디 가져오기 
//    	String masterId= detailService.getMasterId(locationNo);
//    	log.info(masterId);
//		model.addAttribute("entityId", masterId);
//		return "chat/chat";
//	}
	
	
	@Autowired 
	public  LocationController(LocationService detailService,ChatService chatService) {
		this.detailService=detailService;
		this.chatService=chatService;
	}

	
	@GetMapping("/detail")
	public String DetailLocation(@RequestParam(value="locationNo",defaultValue="1") int locationNo,Model model,HttpSession session) {
		
	
		//장소정보와 ,리뷰 정보도
		// 공간 이미지를 db에서 받아온다. ,리뷰 정보도
	  //	DetailLocation_ detailLocation =  detailService.selectDetailLocation_(locationNo);
	  	
	  	
		int reviewCount=detailService.selectReviewCount(locationNo);
		PageInfo pi =Pagination.getPageInfo(reviewCount,1,10,5);
	  	ArrayList<Review> reviews =detailService.selectDetailReviewList(locationNo,pi);
	  	
	
        DetailLocation detailLocations =detailService.selectDetailLocation(locationNo);
		
		//로그인 유저 정보 가져오기
		Member loginUser= (Member)session.getAttribute("loginUser");
		String checkedMaster="NNNN";
		int userNo=-1;
		
		if(loginUser!=null) {
			//사장인지 체크
			if((loginUser.getUserNo()==detailLocations.getUserNo())&& (detailLocations.getUserKind().equals("Y"))) {
				checkedMaster="YYYY";
			}
			userNo=loginUser.getUserNo();
		}
		
		System.out.println(checkedMaster);
		model.addAttribute("reviewPi",pi);
		model.addAttribute("review",reviews);
		model.addAttribute("l",detailLocations);
		model.addAttribute("checkedMaster",checkedMaster);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("userNo",userNo);
		
		return "location/detail";
	}
	
	
	//유저 찜 상태 가져오는 컨트롤러
	@ResponseBody
	@PostMapping(value="state",produces="application/json; charset=utf-8")
	public String pickedState(@RequestBody PickedInfo pickedInfo) {
		 
		
		//찜 확인(db거친다)
		//이 공간에대한 유저 찜 상태 받기
		int count= detailService.pickedStatus(pickedInfo);
		char status=' ';
		
		//찜 상태검사
		if(count==0) {
			status='n';
			//count++;
		}
		else {
			status='y';
			//count--;
		}

	    return new Gson().toJson(status);
	}
	
	
	 //공간 찜 전체개수
	@ResponseBody
	@PostMapping(value="count",produces="application/json; charset=utf-8")
	public String pickedCount(@RequestBody PickedInfo pickedInfo) {
			 
			//찜 확인(db거친다)
		     //이 공간에대한 전채찜 개수 받기
			int count= detailService.pickedCount(pickedInfo.getLocationNo());
	
		    return new Gson().toJson(count);
	}
	
	
	//유저가 찜하기 
	@ResponseBody
	@PostMapping(value="pick",produces="application/json; charset=utf-8")
	public String pick(@RequestBody PickedInfo pickedInfo) {
		System.out.println("pickedSErver:"+pickedInfo);
//		
		char status=pickedInfo.getStatus();
		int count= detailService.pickedStatus( pickedInfo);
		
		int result=0;
		if(count==0) {
		    result=detailService.insertPicked(pickedInfo);
			status='y';
		}
		else {
			result=detailService.deletePicked(pickedInfo);
			status='n';
		}
		
	    return new Gson().toJson(status);
	}
	
	
	//Review ,file upload
	
	
	
	//여기서 페이징 처리
	@ResponseBody
	@GetMapping(value="list.re",produces="application/json; charset=utf-8")
	public String selectReview(@RequestParam(value="locationNo") int locationNo,
							@RequestParam(value="currentPage",defaultValue="1") int currentPage,
							@RequestParam(value="type",defaultValue="o") String type ) {
		
		int reviewCount=detailService.selectReviewCount(locationNo);
		PageInfo pi =Pagination.getPageInfo(reviewCount,currentPage,10,5);
		
		//selectCategoryReviewList
		
		ReviewInfo reviewInfo = new ReviewInfo();
		reviewInfo.setLocationNo(locationNo);
		reviewInfo.setCurrentPage(currentPage);
		reviewInfo.setType(type);
		
		
	 	ArrayList<Review> reviews =detailService.selectCategoryReviewList(reviewInfo,pi);
	 	ReviewPage reivewPage =new ReviewPage();
	 	reivewPage.setPage(pi);
	 	reivewPage.setReviews(reviews);
	 	
	 	//리뷰 평점 업데이트
	 	int count=detailService.updateDateReviewScore(locationNo,reviewCount);
	
		//System.out.println(new Gson().toJson(pageReview));
		//Type type = new TypeToken<Map<PageInfo, ArrayList<Review>>>(){}.getType();
		System.out.println(new Gson().toJson(reivewPage ));
		//return new Gson().toJson(pageReview);
		return new Gson().toJson(reivewPage);
	}
	
//	@ResponseBody
//	@GetMapping(value="paging.re",produces="application/json; charset=utf-8")
//	public String arrowAjax(@RequestParam(value="locationNo") int locationNo,
//							@RequestParam(value="currentPage",defaultValue="1") int currentPage ) {
//		
//		int reviewCount=detailService.selectReviewCount(locationNo);
//		PageInfo pi =Pagination.getPageInfo(reviewCount,currentPage,10,5);
//		
//		
//	 	ArrayList<Review> reviews =detailService.selectDetailReviewList(locationNo,pi);
//		//System.out.println(reviews);
//		System.out.println(pi.getCurrentPage());
//		System.out.println(pi);
//		return new Gson().toJson(pi.getCurrentPage());
//	}
	
	
	
	@ResponseBody
	@PostMapping(value="insert.re")
	public String insertReview(List<MultipartFile> files,
							  ReviewInfo reviewInfo,
			                  HttpSession session,Model model) {
	
	     
		// List<String> changeNamesList = new ArrayList<String>();
		 Map<String,String>fileNames= new HashMap<String,String>();
		 String path="resources/img/user/";
		 if(files!=null) {
		 	
		 
	      	for(MultipartFile f :files) {
	      		String changeName=saveFile(f,session,"resources/img/user/");
	      		//changeNamesList.add(changeName);
	      		fileNames.put(f.getOriginalFilename(),changeName);
	      	}
		 }
 
	        int count=detailService.insertReview(reviewInfo,fileNames, path);
	        
	      	
	        if(count>0) {
	        	 return "ok";
	        }
	        else {
	        	return "error";
	        }
	 }
	
	private String saveFile(MultipartFile upfile,HttpSession session,String path) {
		//파일명 수정 후 서버에 업로드하기("imgFile.jpg => 202404231004305488.jpg")
				String originName = upfile.getOriginalFilename();
				
				//년월일시분초 
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				
				//5자리 랜덤값
				int ranNum = (int)(Math.random() * 90000) + 10000;
				
				//확장자
				String ext = originName.substring(originName.lastIndexOf("."));
				
				//수정된 첨부파일명
				String changeName = currentTime + ranNum + ext;
				
				//첨부파일을 저장할 폴더의 물리적 경로(session)
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
	
	
	@ResponseBody
	@PostMapping(value="delete.re")
	public String deleteReview( HttpSession session,int reviewNo,int userNo,int locationNo) {
	
		ReviewInfo reviewInfo= new ReviewInfo();
		reviewInfo.setLocationNo(locationNo);
		reviewInfo.setReviewNo(reviewNo);
		reviewInfo.setUserNo(userNo);
		
		String savePath = session.getServletContext().getRealPath("resources/img/user/");
		ArrayList<Attachment> deleteAttachment=detailService.deleteReview(reviewInfo);
		if(deleteAttachment!=null) {
			if(!deleteAttachment.isEmpty()) {
			for(Attachment attachment:deleteAttachment) {
				File file = new File(savePath+attachment.getChangeName());
			    System.out.println(file.getPath());
				if(file.exists()) {
					file.delete();
					System.out.println("파일 삭제됨");
				}
				else {
					System.out.println("파일삭제실패");
				}
			}
	    }
		   return "ok";
		}
		else {
	
			return "fail";
		}
		
		
		
		
	}
	
	//사장님답글 insert
	@ResponseBody
	@PostMapping(value="reply.in")
	public String replyInsert(ReplyInfo reply) {
		
		System.out.println(reply.getContent());
		int count = detailService.insertReply(reply);
		
		return "response";
	}
	
	
//	//분류별 리뷰 분류
//	@ResponseBody
//	@GetMapping(value="review.ca", produces="application/json; charset=utf-8")
//	public String reviewCategory(ReviewInfo review) {
//		
//		System.out.println(review.getType());
//
//		int reviewCount=detailService.selectReviewCount(review.getLocationNo());
//		PageInfo pi =Pagination.getPageInfo(reviewCount,1,10,5);
//		
//		
//	 	ArrayList<Review> reviews =detailService.selectCategoryReviewList(review,pi);
//	 	ReviewPage reivewPage =new ReviewPage();
//	 	reivewPage.setPage(pi);
//	 	reivewPage.setReviews(reviews);
//	 	
//	
//		//System.out.println(new Gson().toJson(pageReview));
//		//Type type = new TypeToken<Map<PageInfo, ArrayList<Review>>>(){}.getType();
//		System.out.println(new Gson().toJson(reivewPage));
//		//return new Gson().toJson(pageReview);
//		return new Gson().toJson(reivewPage);
//	}
	
	
	@RequestMapping(value = "chatPage.cp")
	public String chatPage(@RequestParam(value="locationNo",defaultValue="1") int locationNo,  Model model,HttpSession session) {
		
		Member loginUser =((Member)session.getAttribute("loginUser"));
		log.info("loginUser:{}",loginUser.getUserId());;
		
		String check=loginUser.getUserKind();
		log.info("userKind:{}",check);
		//접속 유저가 사장님이면?
		if(check.equals("Y")) {
			
			
			//채팅 데이터베이스에 유저 목록 가져오기 (자기자신 빼고) status true인 상태인 유저만 가져오기 
			ArrayList<Chat> chats=chatService.selectChats(loginUser.getUserNo());
			ArrayList<UserInfo> userInfo= chatService.selectUserInfo(locationNo);
			
			//사장님이라는 것을 알려줄수있는 표시
			model.addAttribute("master","YMYMYMMYYY");
			model.addAttribute("chats",chats);
			model.addAttribute("chatUserList",userInfo);
			
			
		}
		//접속유저가 일반 회원이면
		else {
			
			//데이터베이스에 채팅방 만들고 유저 참여시키기 
			//사장님 페이지에서 실시간?으로 유저 참여 목록 업데이트 시키키??
		
			
			
			//사장님아이디찾기
			MasterInfo masterInfo= chatService.selectMasterInfo(locationNo);
			model.addAttribute("master","NNNNN");
			model.addAttribute("masterInfo",masterInfo);
			
			
			//나중에 나가기누르면 데이터베이스에서 지워주기 
		}
		
	
		
		 return "chat/chat";
	}
	
	
	//로그인 정보 가져오기-->실패
	@ResponseBody
	@GetMapping(value="user.ge")
	public String getLoginUserNo(HttpSession session) {
		
		Member loginUser= (Member)session.getAttribute("loginUser");
		if(loginUser==null) {
			return "-1";
		}
		else {
			return loginUser.getUserNo()+"";
		}
		
	}
	
	
}
