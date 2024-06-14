package com.kh.mng.common.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.chat.model.dto.ChatInfo;

@Repository
public class ChatDao {

	public int insert(SqlSessionTemplate sqlSession, ChatInfo chatInfo) {
		
		return sqlSession.insert("chatMapper.insertChat",chatInfo);
	}

}
