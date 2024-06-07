package com.kh.mng.search.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.location.model.vo.OperationTime;
import com.kh.mng.search.model.dto.SearchFilter;

@Repository
public class SearchDao {
	
	public int selectLocationListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("searchMapper.selectLocationListCount");
	}
	
	public ArrayList<Location> selectSearchLocationList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectSearchLocationList", keyword, rowBounds);
	}
	
	public ArrayList<Location> selectFilterLocationList(SqlSessionTemplate sqlSession, SearchFilter sf, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		System.out.println("여기 들어왔어?");
		return (ArrayList)sqlSession.selectList("searchMapper.selectFilterLocationList", sf, rowBounds);
	}
	
//	public ArrayList<EnterGrade> selectEnterGradeList(SqlSessionTemplate sqlSession, Location loc){
//		return (ArrayList)sqlSession.selectList("searchMapper.selectEnterGradeList", loc);
//	}
	
	public OperationTime selectOperationTime(SqlSessionTemplate sqlSession, Location loc){
		return sqlSession.selectOne("searchMapper.selectOperationTime", loc);
	}
	
	public int selectPickCount(SqlSessionTemplate sqlSession, Location loc) {
		return sqlSession.selectOne("searchMapper.selectPickCount", loc);
	}
	
	public int selectUserPick(SqlSessionTemplate sqlSession, Location loc) {
		return sqlSession.selectOne("searchMapper.selectUserPick", loc);
	}

}
