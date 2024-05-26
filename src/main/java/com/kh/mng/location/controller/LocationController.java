package com.kh.mng.location.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.mng.location.model.dto.PickedInfo;
import com.kh.mng.location.model.vo.DetailLocation;
import com.kh.mng.location.model.vo.DetailLocationAttachment;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.Review;
import com.kh.mng.location.service.LocationService;

@Controller
public class LocationController {
	@Autowired 
	private LocationService detailService;
	
	
	@GetMapping("/chat")
	public String ChatList() {
		
		return "chat/chat";
	}

	
	@GetMapping("/detail")
	public String DetailLocation(@RequestParam(value="spaceNo",defaultValue="1") int spaceNo,Model model) {
		
		System.out.println(spaceNo);
		//장소정보와 ,리뷰 정보도
		// 공간 이미지를 db에서 받아온다. ,리뷰 정보도
	  	DetailLocation detailLocation =  detailService.selectDetailLocation(spaceNo);
	  	ArrayList<Review> reviews =detailService.selectDetailReviewList(spaceNo);
    	ArrayList<DetailLocationAttachment> mainImg= detailService.selectDetailMainImg(spaceNo);
    	ArrayList<DetailLocationAttachment> detailImg= detailService.selectDetailDetailImg(spaceNo);
//		System.out.println(detailLocation);
		System.out.println(reviews);
		System.out.println(mainImg);
		System.out.println(detailImg);
	    
		model.addAttribute("location",detailLocation);
		model.addAttribute("review",reviews);
		model.addAttribute("mainImg",mainImg);
		model.addAttribute("detailImg",detailImg);
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
	@PostMapping(value="count",produces="application/json; charset:utf-8")
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
	@PostMapping(value="pick",produces="application/json; charset:utf-8")
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
	@PostMapping("/insertReview")
	@ResponseBody
	public String insertBoard(@RequestParam("files")MultipartFile[] upfile,
			 				  @RequestParam("content") String content,
			 				  @RequestParam("starCount") String starCount,
			                  HttpSession session,Model model) {
	
		System.out.println(upfile);
		System.out.println(content);
		System.out.println(starCount);
//		
//		if(!upfile.getOriginalFilename().equals("")) {
//			String changeName = saveFile(upfile,session);
//		
//		}
			
	   return "ok";
	
	}
	
	
	public String saveFile(MultipartFile upfile,HttpSession session) {
		
				String originName = upfile.getOriginalFilename();
				
			
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				
			
				int ranNum = (int)(Math.random() * 90000) + 10000;
				
			
				String ext = originName.substring(originName.lastIndexOf("."));
				
			
				String changeName = currentTime + ranNum + ext;
				
				
				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				
				try {
					upfile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				return changeName;
		
	}
	
	
	//로그인 정보 가져오기
	
	
}
