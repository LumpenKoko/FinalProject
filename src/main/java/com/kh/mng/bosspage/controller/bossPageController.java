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
		return "bosspage/bossmanubar";
	}
	
	@RequestMapping(value="bossLocation.bl")
	public String bossLocation() {
		return "bosspage/bosslocation";
	}
	
	@RequestMapping(value="bossAccommodationinfo.ba")
	public String bossAccommodationinfo() {
		return "bosspage/bossAccommodationinfo";
	}
	@RequestMapping(value="animalhospital.ah")
	public String animalhospital() {
		return "bosspage/animalhospital";
	}

	@RequestMapping(value="bossPageReviews.bp")
	public String bossPageReviews() {
		return "bosspage/bossPageReviews";
	}
	
	@RequestMapping(value="bossCouponPage.bc")
	public String bossCouponPage() {
		return "bosspage/bossCouponPage";
	}
}
