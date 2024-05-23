package com.kh.mng.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		// 아이디가 없을 때
		
		// 비밀번호가 서로 맞지 않을 때
		
		// 성공 했을 때
			// 회원인 경우
			// 사장인 경우
		if (loginUser == null) {
			mv.addObject("errorMsg", "아이디가 일치하지 않습니다.");
			mv.setViewName("member/memberLogin");
//		} else if (비밀번호가 맞지 않는 경우) {
		} else {
			if(loginUser.getUserKind().equals("N")) {
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("main");	
			} else {
				System.out.println("들어왔다.");
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("bosspage/bossmainpage");
			}
		}
		
		System.out.println(loginUser);
		return mv;
	}
	
	// 로그아웃
	@GetMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	// 아이디 중복 확인(회원가입 시)
	@ResponseBody
	@GetMapping("checkId.me")
	public String checkMemberId(String userId) {
		int result = memberService.checkMemberId(userId);
		
		if (result > 0) {
			return "NNNNY";
		} else {
			return "NNNNN";
		}

	}
	
	// 일반회원가입
	@GetMapping("memberEnrollCommon.me")
	public String insertCommonMember(Member m, ModelAndView mv, HttpSession session, HttpServletResponse response) {
		System.out.println(m);

		return "redirect:/";
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
