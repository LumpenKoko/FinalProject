package com.kh.mng.common.chat.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.common.chat.model.dao.ChatDao;
import com.kh.mng.common.chat.model.dto.ChatInfo;

@Service
public class ChatService {

	public final SqlSessionTemplate sqlSession;
	public final ChatDao chatDao;
	
	@Autowired
	public ChatService(SqlSessionTemplate sqlSession,ChatDao chatDao) {
		this.sqlSession=sqlSession;
		this.chatDao=chatDao;
	}
	
	public int insertChats(ChatInfo chatInfo) {
		
		return chatDao.insert(sqlSession,chatInfo);
	}
	
	
}
