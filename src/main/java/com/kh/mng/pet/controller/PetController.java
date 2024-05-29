package com.kh.mng.pet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mng.member.model.vo.Member;
import com.kh.mng.pet.model.vo.Pet;
import com.kh.mng.pet.service.PetService;

@RestController
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
	
	
	@RequestMapping("updatePet.mp")
	public String updatePet(Pet p, HttpSession session, Model model) {
	    
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
	        return "myPage/myPagePetInfo";
	    } else {
	        model.addAttribute("errorMsg", "반려동물 정보 수정 실패");
	        return "myPage/myPagePetInfo";
	    }
	}
	
//	@PostMapping("updatePet.mp")
//	public String updatePet(@RequestBody Pet p, HttpSession session, Model model) {
//	    // 세션에서 로그인한 사용자 정보 가져오기
//	    Member loginUser = (Member) session.getAttribute("loginUser");
//	    if (loginUser != null) {
//	        // 로그인한 사용자 정보에서 사용자 번호 가져오기
//	        int userNo = loginUser.getUserNo();
//
//	        // 사용자 번호를 Pet 객체에 설정
//	        p.setUserNo(userNo);
//
//	        int result = petService.updatePet(p);
//	        if (result > 0) {
//	            session.setAttribute("pet", p);
//	            session.setAttribute("alertMsg", "반려동물 정보 수정 성공");
//	            // 성공 시 해당 JSP 페이지로 이동
//	            return "myPage/myPagePetInfo";
//	        } else {
//	            model.addAttribute("errorMsg", "반려동물 정보 수정 실패");
//	        }
//	    }
//	    // 실패 시 해당 JSP 페이지로 이동
//	    return "myPage/myPagePetInfo";
//	}
}
