package com.kh.mng.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("loginForm.me")
	public String loginMember() {
		return "member/memberLogin";
	}

}
