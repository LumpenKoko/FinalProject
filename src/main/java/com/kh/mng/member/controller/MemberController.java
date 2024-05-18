package com.kh.mng.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("loginForm.me")
	public String memberLoginForm() {
		return "member/memberLogin";
	}
	
	@RequestMapping("searchMemberForm.me")
	public String memberSearchForm() {
		return "member/memberSearch";
	}
	
	@RequestMapping("changePwdForm.me")
	public String changePwdForm() {
		return "member/memberChangePwd";
	}
	
	@RequestMapping("memberEnrollCommonForm.me")
	public String memberEnrollCommonForm() {
		return "member/memberEnrollCommon";
	}

}
