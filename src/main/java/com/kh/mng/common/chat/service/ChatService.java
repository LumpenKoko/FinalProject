package com.kh.mng.common.chat.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mng.common.chat.model.dao.ChatDao;
import com.kh.mng.common.chat.model.dto.ChatInfo;
import com.kh.mng.common.chat.model.vo.Chat;
import com.kh.mng.common.chat.model.vo.MasterInfo;
import com.kh.mng.common.chat.model.vo.UserInfo;

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

	public int outChatRoom(int userNo) {
		
		return chatDao.outChat(sqlSession,userNo);
		
	}

	public int joinChatRoom(int userNo) {
		
		return chatDao.joinChat(sqlSession,userNo);
		
	}

	public MasterInfo selectMasterInfo(int locationNo) {
		// TODO Auto-generated method stub
		return chatDao.selectMasterInfo(sqlSession,locationNo);
	}
	
	public ArrayList<UserInfo> selectUserInfo(int locationNo) {
		// TODO Auto-generated method stub
		return chatDao.selectUserInfo(sqlSession,locationNo);
	}

	public ArrayList<Chat> selectChats(int userNo) {
	
		return chatDao.selectChats(sqlSession,userNo);
	}
	
	
}
