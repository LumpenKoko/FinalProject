package com.kh.mng.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mng.member.model.vo.Member;
import com.kh.mng.member.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	// 로그인 창으로 가는 메소드
	@GetMapping("loginForm.me")
	public String memberLoginForm() {
		return "member/memberLogin";
	}
	
	// 로그인 메소드
	@GetMapping("login.me")
	public ModelAndView memberLogin(Member m, ModelAndView mv, HttpSession session, HttpServletResponse response) {
		Member loginUser = memberService.loginMember(m);
		
		session.setAttribute("loginUser", loginUser);
		mv.setViewName("redirect:/");
		return mv;
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
	
	@RequestMapping("memberEnrollAdminForm.me")
	public String memberEnrollAdminForm() {
		return "member/memberEnrollAdmin";
	}
	
	@RequestMapping("memberEnrollSelectForm.me")
	public String memberEnrollSelectForm() {
		return "member/memberEnrollSelect";
	}

}
