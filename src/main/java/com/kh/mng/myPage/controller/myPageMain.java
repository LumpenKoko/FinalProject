package com.kh.mng.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myPageMain {
	
	@RequestMapping(value="myPageMain.mp")
	public String myPageMain() {
		return "myPage/myPageMain";
	}
}
