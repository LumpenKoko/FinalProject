package com.kh.mng.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.bosspage.model.vo.BossLocation;
import com.kh.mng.community.model.vo.Shorts;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.MyPageReview;
import com.kh.mng.location.model.vo.Picked;
import com.kh.mng.location.model.vo.WishListNo;
import com.kh.mng.member.model.vo.Member;

@Repository
public class MemberDao {
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int checkMemberId(SqlSessionTemplate sqlSession, String checkId) {
//		Member m = new Member();
//		m.setUserId(userId);
//		userId는 이미 Member의 result값으로 받겠다고 하니까 userId로 동일하게 넣으면 파라미터 값이 없다고 오류가 뜨는 것 같다
//		SELECT USER_ID 하면 자료형이 String이니까 resultType int로 못 받지...
		return sqlSession.selectOne("memberMapper.checkMemberId", checkId);
	}
	
	// 회원가입
	public int insertCommonMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertCommonMember", m);
	}
	
	public int insertBossMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertBossMember", m);
	}
	
	public int selectUserNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectUserNo");
	}
	
	public int insertLocation(SqlSessionTemplate sqlSession, Location loc) {
		return sqlSession.insert("location.insertLocation", loc);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
	
	public List<Picked> getPickList(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectList("picked.getPickList", userNo);
	}
	
	public List<BossLocation> getLocationList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("location.getLocationList");
	}
	
	public int wishListDelete(SqlSessionTemplate sqlSession, WishListNo wishListNo) {
		return sqlSession.delete("picked.pickedDelete", wishListNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("communityBoardMapper.deleteBoard", boardNo);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.delete("review.deleteMyReview", reviewNo);
	}

	public List<Shorts> getShortsList(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectList("shortsMapper.getVideoInfo", userNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, MyPageReview myReview) {
		return sqlSession.update("review.updateReview", myReview);
	}
}
