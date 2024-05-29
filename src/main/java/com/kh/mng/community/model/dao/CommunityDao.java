package com.kh.mng.community.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDao {
	
	public String getVideo(SqlSessionTemplate sqlSession, int videoId) {
		return sqlSession.selectOne("shortsMapper.getVideo", videoId);
	}

	public int addComment(SqlSessionTemplate sqlSession, String comment) {
		return sqlSession.insert("shortsMapper.shortsCommentEnroll", comment);
		
	}

}
