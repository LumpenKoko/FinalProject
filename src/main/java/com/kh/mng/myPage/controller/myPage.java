package com.kh.mng.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myPage {
	
	@RequestMapping(value="myPageMain.mp")
	public String myPageMain() {
		return "myPage/myPageMain";
	}
	
	@RequestMapping(value="myPageWish.mp")
	public String myPageWishList() {
		return "myPage/myPageWishList";
	}
	
	@RequestMapping(value="myPageCoupon.mp")
	public String myPageCoupon() {
		return "myPage/myPageCoupon";
	}

	@RequestMapping(value="myPageBoard.mp")
	public String myPageBoardList() {
		return "myPage/myPageBoardList";
	}
	
	@RequestMapping(value="myPageShorts.mp")
	public String myPageShortsList() {
		return "myPage/myPageShortsList";
	}
	
	@RequestMapping(value="myPageInfo.mp")
	public String myPageInfo() {
		return "myPage/myPageInfo";
	}
}
