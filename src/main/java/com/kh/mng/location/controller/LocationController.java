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
import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.common.model.vo.Pagination;
import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.dto.ReplyInfo;
import com.kh.mng.location.model.dto.ReviewInfo;
import com.kh.mng.location.model.dto.ReviewPage;
import com.kh.mng.location.model.vo.DetailLocation_;
import com.kh.mng.location.model.vo.DetailLocationAttachment;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.Review;
import com.kh.mng.location.service.LocationService;
import com.kh.mng.member.model.vo.Member;
import com.kh.mng.location.model.vo.DetailLocation; 


@Controller
public class LocationController {
	@Autowired 
	private LocationService detailService;
	
	
	@GetMapping("/chat")
	public String ChatList() {
		
		return "chat/chat";
	}

	
	@GetMapping("/detail")
	public String DetailLocation(@RequestParam(value="locationNo",defaultValue="1") int locationNo,Model model,HttpSession session) {
		
		System.out.println(locationNo);
		//장소정보와 ,리뷰 정보도
		// 공간 이미지를 db에서 받아온다. ,리뷰 정보도
	  //	DetailLocation_ detailLocation =  detailService.selectDetailLocation_(locationNo);
	  	
	  	
		int reviewCount=detailService.selectReviewCount(locationNo);
		PageInfo pi =Pagination.getPageInfo(reviewCount,1,10,5);
	  	ArrayList<Review> reviews =detailService.selectDetailReviewList(locationNo,pi);
		System.out.println(reviews);
	  	
		//이방법으로 할것!!
        DetailLocation detailLocations =detailService.selectDetailLocation(locationNo);
		System.out.println(detailLocations);
		
		//로그인 유저 정보 가져오기
		Member loginUser= (Member)session.getAttribute("loginUser");
		if(loginUser==null) {
			model.addAttribute("userNo",-1);
		}
		else {
			model.addAttribute("userNo",loginUser.getUserNo());
		}
		
	  	
//    	ArrayList<DetailLocationAttachment> mainImg= detailService.selectDetailMainImg(locationNo);
//    	ArrayList<DetailLocationAttachment> detailImg= detailService.selectDetailDetailImg(locationNo);
//		System.out.println(detailLocation);
	
//		System.out.println(mainImg);
//		System.out.println(detailImg);
//	    
//		model.addAttribute("location",detailLocation);
//		model.addAttribute("mainImg",mainImg);
//		model.addAttribute("detailImg",detailImg);
		
		model.addAttribute("reviewPi",pi);
		model.addAttribute("review",reviews);
		model.addAttribute("l",detailLocations);
		
		return "location/detail";
	}
	
	
	//유저 찜 상태 가져오는 컨트롤러
	@ResponseBody
	@PostMapping(value="state",produces="application/json; charset:utf-8")
	public String pickedState(@RequestBody PickedInfo pickedInfo) {
		 
		System.out.println(pickedInfo);
		
		//찜 확인(db거친다)
		//이 공간에대한 유저 찜 상태 받기
		int count= detailService.pickedStatus(pickedInfo);
		char status=' ';
		
	    System.out.println(count);
		//찜 상태검사
		if(count==0) {
			status='n';
			//count++;
		}
		else {
			status='y';
			//count--;
		}
	
		System.out.println("유저 찜 상태:"+status);
	    return new Gson().toJson(status);
	}
	
	
	 //공간 찜 전체개수
	@ResponseBody
	@PostMapping(value="count",produces="application/json; charset=utf-8")
	public String pickedCount(@RequestBody PickedInfo pickedInfo) {
			 
			System.out.println("pickedCount:"+pickedInfo);
			
			//찜 확인(db거친다)
		     //이 공간에대한 전채찜 개수 받기
			int count= detailService.pickedCount(pickedInfo.getLocationNo());
			System.out.println("공간전체 찜 개수:"+count);
		
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
		
		System.out.println("status:"+status);
	    return new Gson().toJson(status);
	}
	
	
	//Review ,file upload
	
	
	
	//여기서 페이징 처리
	@ResponseBody
	@GetMapping(value="list.re",produces="application/json; charset=utf-8")
	public String selectReview(@RequestParam(value="locationNo") int locationNo,
							@RequestParam(value="currentPage",defaultValue="1") int currentPage ) {
		
		int reviewCount=detailService.selectReviewCount(locationNo);
		PageInfo pi =Pagination.getPageInfo(reviewCount,currentPage,10,5);
		
		
	 	ArrayList<Review> reviews =detailService.selectDetailReviewList(locationNo,pi);
	 	ReviewPage reivewPage =new ReviewPage();
	 	reivewPage.setPage(pi);
	 	reivewPage.setReviews(reviews);
	 	
	
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
	
	     System.out.println(reviewInfo.getStarCount());
	     System.out.println(reviewInfo.getContent());
	     System.out.println(reviewInfo.getLocationNo());
	     System.out.println(reviewInfo.getUserNo());
	     
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
	
	public String saveFile(MultipartFile upfile,HttpSession session,String path) {
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
	public String deleteReview(int reviewNo,int userNo,int locationNo) {
	
		ReviewInfo reviewInfo= new ReviewInfo();
		reviewInfo.setLocationNo(locationNo);
		reviewInfo.setReviewNo(reviewNo);
		reviewInfo.setUserNo(userNo);
		
		
		System.out.println("삭제: "+reviewInfo);
		int count=detailService.deleteReview(reviewInfo);
		
		if(count>=0) {
			System.out.println("count:"+count);
			return "ok";
		}
		else {
			System.out.println("count:"+count);
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
