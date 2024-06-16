package com.kh.mng.common.chat.service;


import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mng.common.chat.model.dao.ChatDao;
import com.kh.mng.common.chat.model.dto.ChatInfo;
import com.kh.mng.common.chat.model.dto.UserTarget;
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
	
	@Transactional
	public ArrayList<UserInfo> selectUserInfo(int userNo) {
		//넘어오는 userNo는 사장님 userNO
		ArrayList<UserInfo> userInfo=chatDao.selectUserInfo(sqlSession,userNo);
		 
		if(!userInfo.isEmpty()) {
			//UserInfo에서 반환되는 userNo는 유저userNo
			for(UserInfo userList:userInfo) {
				int messageCount=chatDao.selectNotifyMessageCount(sqlSession,userList.getUserNo());
				Map<String,String> lastestMessage=chatDao.selectNotifyMessage(sqlSession,userList.getUserNo());
				userList.setMessageCount(messageCount);
				userList.setLastestMessage(lastestMessage);
			}
			
		}
		
		return  userInfo;
	}

	//유저 채팅목록 가져오는 서비스
	@Transactional
	public ArrayList<Chat> selectUserChats(UserTarget userTargetInfo) {
	
		//notify상태를 fasle로 변환시켜준다.
		ArrayList<Chat> selectUserChats = chatDao.selectUserChats(sqlSession,userTargetInfo);
		int count=1;
		if(!selectUserChats.isEmpty()) {
			for(Chat chats:selectUserChats) {
			    count=chatDao.updateNotify(sqlSession,chats.getChatNo());
				count*=count;
			}
		}
		
		if(count>0) {
			return selectUserChats;
		}else {
			return null;
		}
		
		
	}
	
	
}
