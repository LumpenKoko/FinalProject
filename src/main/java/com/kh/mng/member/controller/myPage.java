package com.kh.mng.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.mng.member.model.vo.Member;
import com.kh.mng.member.service.MemberService;

@Controller
public class myPage {
	
	@GetMapping("/myPageMain.mp")
	public String myPageMain() {
		return "myPage/myPageMain";
	}
	
	@GetMapping("/myPageWish.mp")
	public String myPageWishList() {
		return "myPage/myPageWishList";
	}
	
	@GetMapping("/myPageCoupon.mp")
	public String myPageCoupon() {
		return "myPage/myPageCoupon";
	}

	@GetMapping("/myPageBoard.mp")
	public String myPageBoardList() {
		return "myPage/myPageBoardList";
	}
	
	@GetMapping("/myPageShorts.mp")
	public String myPageShortsList() {
		return "myPage/myPageShortsList";
	}
	
	@GetMapping("myPageInfo.mp")
	public String myPageInfo() {
		return "myPage/myPageInfo";
	}
	
	@GetMapping("myPagePetInfo.mp")
	public String myPagePetInfo() {
		return "myPage/myPagePetInfo";
	}
	
	@GetMapping("myPagePetSignUp.mp")
	public String myPagePetSignUp() {
		return "myPage/myPagePetSignUp";
	}
}
