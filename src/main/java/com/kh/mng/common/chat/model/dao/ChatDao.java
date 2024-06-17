package com.kh.mng.common.chat.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mng.common.chat.model.dto.ChatInfo;
import com.kh.mng.common.chat.model.dto.UserTarget;
import com.kh.mng.common.chat.model.vo.Chat;
import com.kh.mng.common.chat.model.vo.MasterInfo;
import com.kh.mng.common.chat.model.vo.UserInfo;

@Repository
public class ChatDao {

	public int insert(SqlSessionTemplate sqlSession, ChatInfo chatInfo) {
		
		return sqlSession.insert("chatMapper.insertChatRoom",chatInfo);
	}

	public int outChat(SqlSessionTemplate sqlSession, int userNo) {
	
		return sqlSession.update("chatMapper.outChatRoom",userNo);
	}

	public int joinChat(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("chatMapper.joinChatRoom",userNo);
	}

	public MasterInfo selectMasterInfo(SqlSessionTemplate sqlSession,int locationNo) {
	
		return sqlSession.selectOne("chatMapper.selectMasterInfo",locationNo);
	}
	
	public ArrayList<UserInfo> selectUserInfo(SqlSessionTemplate sqlSession,int userNo) {
		
		return (ArrayList) sqlSession.selectList("chatMapper.selectUserInfo",userNo);
	}

	public ArrayList<Chat> selectUserChats(SqlSessionTemplate sqlSession, UserTarget userMasterInfo) {
		
		
		return (ArrayList) sqlSession.selectList("chatMapper.selectUserChats", userMasterInfo);
	}

	public int selectNotifyMessageCount(SqlSessionTemplate sqlSession,int userNo) {
		
		return sqlSession.selectOne("chatMapper.selectNotifyMessageCount",userNo);
	}

	public Map<String, String> selectNotifyMessage(SqlSessionTemplate sqlSession,int userNo) {
		
		return (Map)sqlSession.selectOne("chatMapper.selectlastestMessage", userNo);
	}

	public int updateNotify(SqlSessionTemplate sqlSession,int chatNo) {
		
		return sqlSession.update("chatMapper.updateNotify",chatNo);
	}

}
