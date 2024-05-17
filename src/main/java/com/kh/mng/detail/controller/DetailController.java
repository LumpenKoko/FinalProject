package com.kh.mng.detail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DetailController {
	
	@GetMapping("/detail")
	public String DetailView() {
		
		return "detail/detail";
	}

}
