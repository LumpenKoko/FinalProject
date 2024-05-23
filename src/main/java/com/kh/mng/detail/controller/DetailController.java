package com.kh.mng.detail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.mng.detail.model.vo.PickedInfo;
import com.kh.mng.detail.service.DetailService;

@Controller
public class DetailController {
	@Autowired 
	private DetailService detailService;
	
	@GetMapping("/detail")
	public String DetailView(@RequestParam(value="spaceNo",defaultValue="1") String spaceNo) {
		
		System.out.println(spaceNo);
		//장소정보와
		// 공간 이미지를 db에서 받아온다.
		
		return "detail/detail";
	}
	
	
	
	
	
	//유저 찜 상태 가져오는 컨트롤러
	@ResponseBody
	@PostMapping(value="state",produces="application/json; charset:utf-8")
	public String pickedState(@RequestBody PickedInfo pickedInfo) {
		 
		System.out.println(pickedInfo);
		
		//찜 확인(db거친다)
		//이 공간에대한 유저 찜 상태 받기
		int count= detailService.pickedStatus( pickedInfo);
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
	
	
	//로그인 정보
	
	
}
