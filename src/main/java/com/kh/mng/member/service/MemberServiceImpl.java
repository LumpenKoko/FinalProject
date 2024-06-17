package com.kh.mng.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.location.model.dao.DetailDao;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.MyPageReview;
import com.kh.mng.location.model.vo.Picked;
import com.kh.mng.location.model.vo.WishListNo;
import com.kh.mng.member.model.dao.MemberDao;
import com.kh.mng.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private DetailDao detailDao;

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int checkMemberId(String userId) {
		return memberDao.checkMemberId(sqlSession, userId);
	}

	@Override
	public int insertCommonMember(Member m) {
		return memberDao.insertCommonMember(sqlSession, m);
	}

	@Override
	@Transactional
	public int insertBossMember(Member m, Location loc) {
		int result1 = memberDao.insertBossMember(sqlSession, m);
		int result2 = 1;
		int userNo = 0;

		if (result1 == 1) {
			userNo = memberDao.selectUserNo(sqlSession);

			if (userNo != 0) {
				loc.setUserNo(userNo);
				result2 = memberDao.insertLocation(sqlSession, loc);
			}
		} else {
			result1 = 0;
		}

		return result1 * result2;
	}

	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(int userNo) {
		return memberDao.deleteMember(sqlSession, userNo);
	}

	@Override
	public List<Picked> getPickList(int userNo) {
		return memberDao.getPickList(sqlSession, userNo);
	}

	@Override
	public List<BossLocation> getLocationList() {
		return memberDao.getLocationList(sqlSession);
	}

	@Override
	public int wishListDelete(WishListNo wishListNo) {
		return memberDao.wishListDelete(sqlSession, wishListNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return memberDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return memberDao.deleteReview(sqlSession, reviewNo);
	}

	@Override
	public List<Shorts> getShortsList(int userNo) {
		return memberDao.getShortsList(sqlSession, userNo);
	}

	@Override
	public int updateReview(MyPageReview myReview) {
		return memberDao.updateReview(sqlSession, myReview);
	}
}
