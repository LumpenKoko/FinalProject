package com.kh.mng.location.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.mng.location.model.vo.detail.DetailLocation;
import com.kh.mng.location.model.vo.detail.Location;
import com.kh.mng.location.model.vo.detail.PickedInfo;
import com.kh.mng.location.model.vo.detail.Review;
import com.kh.mng.location.service.DetailService;

@Controller
public class DetailLocationController {
	@Autowired 
	private DetailService detailService;
	
	@GetMapping("/detail")
	public String DetailView(@RequestParam(value="spaceNo",defaultValue="1") int spaceNo,Model model) {
		
		System.out.println(spaceNo);
		//장소정보와 ,리뷰 정보도
		// 공간 이미지를 db에서 받아온다. ,리뷰 정보도
	  	DetailLocation detailLocation =  detailService.selectDetailLocation(spaceNo);
	  	ArrayList<Review> reviews =detailService.selectDetailReviewList(spaceNo);
		System.out.println(detailLocation);
		System.out.println(reviews);
	    
		model.addAttribute("location",detailLocation);
		model.addAttribute("review",reviews);
		
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
	
		
	@GetMapping("/chat")
	public String ChatList() {
		
		return "chat/chat";
	}
	
	
	//로그인 정보 가져오기
	
	
}
