package com.kh.mng.bosspage.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.bosspage.model.dao.BossPageDaoSecond;
import com.kh.mng.bosspage.model.dto.CouponKind;
import com.kh.mng.common.phonesms.PhoneSmsVo;
import com.kh.mng.community.model.dto.BoardEnroll;
import com.kh.mng.community.model.dto.BoardFileInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BossPageServiceImplSecond implements BossPageServiceSecond{
	
//private final MemberService memberService;
//	
//	private final BCryptPasswordEncoder bcryptPasswordEncoder;
//	
////	이 생성자는 객체가 생성될 때 만들어지는 것이므로 사이에 null이 들어갈 시차가 생기지 않음
//	@Autowired
//	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
//		this.memberService = memberService;
//		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
//	}
	
	private final BossPageDaoSecond bossPageDaoSecond;
    private final SqlSessionTemplate sqlSession;
    
    @Autowired
    public BossPageServiceImplSecond(BossPageDaoSecond bossPageDaoSecond, SqlSessionTemplate sqlSession) {
    	this.bossPageDaoSecond = bossPageDaoSecond;
    	this.sqlSession = sqlSession;
    }
//	@Autowired
//    private BossPageDaoSecond bossPageDaoSecond;

//    @Autowired
//    private SqlSessionTemplate sqlSession;

    
    
	@Override
	public ArrayList<CouponKind> selectCouponKindList(String loginUserNo) {
		return bossPageDaoSecond.selectCouponKindList(sqlSession, loginUserNo);
	}

	@Override
	public int insertCouponKind(CouponKind coupon) {
		int locNo = bossPageDaoSecond.selectLocationNo(sqlSession, coupon);
		coupon.setLocationNo(String.valueOf(locNo));
		return bossPageDaoSecond.insertCouponKind(sqlSession, coupon);
	}

	@Override
	public CouponKind updateCouponKind(CouponKind coupon) {
		int result = bossPageDaoSecond.updateCouponKind(sqlSession, coupon);
		CouponKind newCoupon = null;
		
		if (result > 0) {
			newCoupon = bossPageDaoSecond.selectCouponKind(sqlSession, coupon.getCouponNo());
		} 
		
		return newCoupon;
	}

	@Override
	public int deleteCouponkind(int couponNo) {
		return bossPageDaoSecond.deleteCouponKind(sqlSession, couponNo);
	}

	@Override
	public int insertBoard(BoardEnroll board, BoardFileInfo boardfile) {
		int result1 = bossPageDaoSecond.insertBoard(sqlSession, board);
		int result2 = 1;
		
		if (result1 > 0) {
			result2 = bossPageDaoSecond.insertBoardAttachment(sqlSession, boardfile);
		} else {
			result1 = result1 * 0;
		}
		
		return result1 * result2;
	}

	
	
	
	
	// 핸드폰 중복 체크
	@Override
	public int checkPhoneNumber(String userPhone) {
		return bossPageDaoSecond.checkPhoneNumber(sqlSession, userPhone);
	}
	
	@Override
	public int insertCertifyCode(PhoneSmsVo psv) {
//		이 메소드에서만 sqlSession이 null로 뜨는 현상 발생 / 생성자 주입 방식을 통해 해결
		return bossPageDaoSecond.insertCertifyCode(sqlSession, psv);
	}

	@Override
	public PhoneSmsVo checkCertifyCode(String phone) {
		return bossPageDaoSecond.checkCertifyCode(sqlSession, phone);
	}

	
	
}
