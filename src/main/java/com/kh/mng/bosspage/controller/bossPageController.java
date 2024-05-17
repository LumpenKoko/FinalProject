package com.kh.mng.bosspage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class bossPageController {
	
	@RequestMapping(value="bossMainPage.bm")
	public String bossPrivacy(){
		return "bosspage/bossmainpage";
	}
	
	@RequestMapping(value="bossManuBar.bm")
	public String bossManuBar() {
		return "bosspage.bossmanubar";
	}
}
