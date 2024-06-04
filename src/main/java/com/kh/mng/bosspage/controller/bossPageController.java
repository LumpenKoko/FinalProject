package com.kh.mng.bosspage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mng.bosspage.model.vo.BossPage;
import com.kh.mng.bosspage.service.BossPageService;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.member.model.vo.Member;


//@Controller -> 요청을 받아서 응답을 돌려주는 역할
@Controller
public class bossPageController {

	@Autowired
	private BossPageService bossPageService;

	@RequestMapping("bossMainPage.bm")
	public String bossPrivacy(Model model, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		//지금 로그인한 사람정보
		
		
		if (loginUser != null) {
			//로그인이 되어있을 때
			
			int userNo = loginUser.getUserNo();
			
			//사장님 정보 데이터베이스로부터 userNo보내서 가져오기
			Location location = bossPageService.getLocation(userNo);
			
			
			//가게정보 request영역에 담기
			model.addAttribute("location", location);
			
			model.addAttribute("userNo", userNo);
			
			return "bosspage/bossmainpage"; //포워딩 -> url은 그대로, 화면만 변경
		} else {
			return "redirect:/";//redirect -> url과 화면을 다 바꿔줘야할 때
		}
	}
	
	@ResponseBody
	@PostMapping(value="/updatePhoneNumber.bm", produces="text/plain;charset=UTF-8")
    public String updatePhoneNumber(BossPage bossPage, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
           int count= bossPageService.updatePhoneNumber(bossPage);
           if(count > 0) {
        	   return "전화번호 업데이트 성공";
           }else {
        	   return "전화번호 업데이트 실패"; 
           }
           
        }
        return "로그인이 필요합니다.";
    }

	@ResponseBody
    @PostMapping(value="/updateEmail.bm", produces="text/plain;charset=UTF-8")
    public String updateEmail(BossPage bossPage, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            int count=bossPageService.updateEmail(bossPage);
            if(count > 0) {
            	 return "이메일 업데이트 성공";
            }
            else {
                return "이메일 업데이트 실패";
            }
            
        }
        return "로그인이 필요합니다.";
    }
	
	

	@RequestMapping(value = "bossManuBar.bm")
	public String bossManuBar() {
		return "bosspage/bossmanubar";
	}

	@RequestMapping(value = "bossLocation.bl")
	public String bossLocation() {
		return "bosspage/bosslocation";
	}

	@RequestMapping(value = "bossAccommodationinfo.ba")
	public String bossAccommodationinfo() {
		return "bosspage/bossAccommodationinfo";
	}

	@RequestMapping(value = "animalhospital.ah")
	public String animalhospital() {
		return "bosspage/animalhospital";
	}

	@RequestMapping(value = "bossPageReviews.bp")
	public String bossPageReviews() {
		return "bosspage/bossPageReviews";
	}

	@RequestMapping(value = "bossCouponPage.bc")
	public String bossCouponPage() {
		return "bosspage/bossCouponPage";
	}

	@RequestMapping(value = "chatPage.cp")
	public String chatPage() {
		return "chat/chat";
	}
}
