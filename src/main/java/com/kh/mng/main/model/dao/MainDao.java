package com.kh.mng.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.model.vo.Attachment;
import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.EnterGrade;
import com.kh.mng.location.model.vo.Location;

@Repository
public class MainDao {
	public Location selectLocationTop(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("mainMapper.selectLocationTop", map);
	}

	public Attachment selectAttachment(SqlSessionTemplate sqlSession, Location loc) {
		return sqlSession.selectOne("mainMapper.selectAttachment", loc);
	}
	
	public ArrayList<EnterGrade> selectEnterGradeList(SqlSessionTemplate sqlSession, Location loc) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectEnterGradeList", loc);
	}
	
	public ArrayList<Board> ajaxSelectBoardMainList(SqlSessionTemplate sqlSession, int type){
		return (ArrayList)sqlSession.selectList("mainMapper.ajaxSelectBoardMainList", type);
	}
//	1. COUNT 순서대로 조회한 걸 DESC
//	2. BOARD_NO을 가진 GOOD을 COUNT 해서 GOOD 개수 기준으로 DESC
//	3. BOARD_NO을 가진 REPLY를 COUNT 해서 REPLY 개수 기준으로 DESC
//	그런데 모든 경우의 수에 반드시 REPLY 개수를 COUNT 해서 조회해야 함
	
}
