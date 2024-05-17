package com.kh.mng.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	@RequestMapping(value="community.bo")
	public String myPageMain() {
		return "community/boardMain";
	}
}
