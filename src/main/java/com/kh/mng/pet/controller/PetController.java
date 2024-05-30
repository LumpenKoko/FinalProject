package com.kh.mng.pet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mng.member.model.vo.Member;
import com.kh.mng.pet.model.vo.Pet;
import com.kh.mng.pet.service.PetService;

@Controller
public class PetController {
	
	@Autowired
	private PetService petService;
	
	@RequestMapping("insertPet.mp")
	public String insertPet(Pet p, HttpSession session, Model model) {
		
	    // 세션에서 로그인한 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    // 로그인한 사용자 정보에서 사용자 번호 가져오기
	    int userNo = loginUser.getUserNo();

	    // 사용자 번호를 Member 객체에 설정
	    p.setUserNo(userNo);
		
		int result = petService.insertPet(p);		
		
		if (result > 0) {
			session.setAttribute("alertMsg", "반려동물 등록에 성공하셨습니다.");
			return "redirect:/myPagePetInfo.mp";
		} else {
			model.addAttribute("errorMsg", "반려동물 등록에 실패하셨습니다.");
			return "redirect:/myPagePetInfo.mp";
		}
	}
	
	
	
//	@ResponseBody
//	@PostMapping(value="updatePet.mp")
//	public String updatePet(Pet p, HttpSession session) {
//	    // 세션에서 로그인한 사용자 정보 가져오기
//	    Member loginUser = (Member) session.getAttribute("loginUser");
//	    // 로그인한 사용자 정보에서 사용자 번호 가져오기
//	    int userNo = loginUser.getUserNo();
//	    // 사용자 번호를 Member 객체에 설정
//	    p.setUserNo(userNo);
//	    
//	    int result = petService.updatePet(p);
//	    System.out.println(p);
//	    if (result > 0) {
//	        session.setAttribute("pet", p); // 여기서 p 대신에 pet 객체를 세션에 추가해야 합니다.
//	        session.setAttribute("alertMsg", "반려동물 정보 수정 성공");
//	        return "success";
//	    } else {
//	        //model.addAttribute("errorMsg", "반려동물 정보 수정 실패");
//	        return "error";
//	    }
//	}
	@PostMapping(value="updatePet.mp")
	public String updatePet(Pet p, HttpSession session) {
	    // 세션에서 로그인한 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    // 로그인한 사용자 정보에서 사용자 번호 가져오기
	    int userNo = loginUser.getUserNo();
	    // 사용자 번호를 Member 객체에 설정
	    p.setUserNo(userNo);
	    
	    int result = petService.updatePet(p);
	    System.out.println(p);
	    if (result > 0) {
	        session.setAttribute("pet", p); // 여기서 p 대신에 pet 객체를 세션에 추가해야 합니다.
	        session.setAttribute("alertMsg", "반려동물 정보 수정 성공");
	        return "redirect:/myPagePetInfo.mp";
	    } else {
	        //model.addAttribute("errorMsg", "반려동물 정보 수정 실패");
	        return "redirect:/myPagePetInfo.mp";
	    }
	}
}
