package com.kh.mng.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mng.location.model.vo.detail.Location;
import com.kh.mng.member.model.vo.Member;
import com.kh.mng.member.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	// security 담당 객체
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 로그인 창으로 가는 메소드
	@GetMapping("loginForm.me")
	public String memberLoginForm() {
		return "member/memberLogin";
	}
	
	// 로그인 메소드
	@PostMapping("login.me")
	public ModelAndView memberLogin(Member m, ModelAndView mv, HttpSession session, HttpServletResponse response) {
		Member loginUser = memberService.loginMember(m);
		
		// 아이디가 없을 때
		if (loginUser == null) {
			mv.addObject("errorMsg", "아이디가 일치하지 않습니다.");
			mv.setViewName("member/memberLogin");
		// 비밀번호가 맞지 않을 때
		} else if (!bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("member/memberLogin");
		// 성공 시
		} else {
			// 일반 회원인 경우
			if(loginUser.getUserKind().equals("N")) {
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("main");	
			// 사장 회원인 경우
			} else {
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("bosspage/bossmainpage");
			}
		}

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
	@PostMapping("memberEnrollCommon.me")
	public String insertCommonMember(Member m, Model model, HttpSession session, HttpServletResponse response) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result = memberService.insertCommonMember(m);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입이 성공적으로 완료 되었습니다. 멍냥가이드와 함께 행복한 하루 되세요!");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패했습니다. 다시 한 번 시도해주세요.");
			return "member/memberEnrollCommon";
		}
	}
	
	// 사장회원가입
	@PostMapping("memberEnrollBoss.me")
	public String insertBossMember(Member m, Location loc, Model model, HttpSession session, HttpServletResponse response) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		loc.setExplanation("장소에 대한 정보를 입력해주세요.");
		loc.setLocationPhone(m.getUserPhone());
		
		int result = memberService.insertBossMember(m, loc);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입이 성공적으로 완료 되었습니다. 멍냥가이드와 함께 행복한 하루 되세요!");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패했습니다. 다시 한 번 시도해주세요.");
			return "member/memberEnrollCommon";
		}
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
