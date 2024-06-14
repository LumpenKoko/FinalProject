package com.kh.mng.bosspage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.mng.bosspage.model.dto.CouponKind;
import com.kh.mng.bosspage.service.BossPageServiceSecond;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BossPageControllerSecond {
	
	@Autowired
	private BossPageServiceSecond bossPageServiceSecond;
	
	@GetMapping("bossCouponPage.bcc")
	public String bossCouponPage(String uno, Model model) {
		ArrayList<CouponKind> couponList = bossPageServiceSecond.selectCouponList(uno);
		
//		1. 쿠폰 내용
//		2. 쿠폰 유효기간
//		3. 발매한 총 쿠폰 수량 / 발매 쿠폰 중 사용 완료한 쿠폰 수량
//		4. 
		
		model.addAttribute("couponList", couponList);
		log.info(couponList.toString());
		
		return "bosspage/bossCouponPage";
	}
	
	@GetMapping("insertCoupon.bc")
	public String insertCoupon(CouponKind coupon, Model model, HttpSession session) {
		log.info(coupon.toString());
		int result = bossPageServiceSecond.insertCouponKind(coupon);
		ArrayList<CouponKind> couponList = bossPageServiceSecond.selectCouponList(coupon.getLoginUserNo());
		if (result > 0) {
			session.setAttribute("alertMsg", "쿠폰 등록에 성공했습니다.");
			
		} else {
			session.setAttribute("alertMsg", "쿠폰 등록에 실패했습니다. 다시 시도해주세요.");
		}
		
		model.addAttribute("couponList", couponList);
		
		return "redirect:/bossCouponPage.bcc?uno=" + coupon.getLoginUserNo();
	}
	
	@ResponseBody
	@GetMapping(value="updateCoupon.bc", produces="application/json; charset=utf-8")
	public String ajaxUpdateCouponKind(CouponKind coupon) {
		CouponKind newCoupon = bossPageServiceSecond.updateCouponKind(coupon);
		log.info(newCoupon.toString());
		return new Gson().toJson(newCoupon);
	}
	
	@GetMapping("deleteCoupon.bc")
	public String deleteCoupon(String cno, String uno, HttpSession session) {
		log.info(uno);
		int couponNo = Integer.parseInt(cno);
		int result = bossPageServiceSecond.deleteCouponkind(couponNo);
		if (result > 0) {
			session.setAttribute("alertMsg", "쿠폰 삭제에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "쿠폰 삭제에 실패했습니다.");
		}
		return "redirect:/bossCouponPage.bcc?uno=" + uno;
	}
}
