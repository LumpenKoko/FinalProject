package com.kh.mng.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myPage {
	
	@RequestMapping(value="Main.mp")
	public String myPageMain() {
		return "myPage/myPageMain";
	}
	
	@RequestMapping(value="Wish.mp")
	public String myPageWishList() {
		return "myPage/myPageWishList";
	}
}
