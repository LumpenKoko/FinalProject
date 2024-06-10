package com.kh.mng.common.chat;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.mng.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ChatServer extends TextWebSocketHandler {
	
	private final Map<String,WebSocketSession> userSession = new ConcurrentHashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Member loginUser = (Member)session.getAttributes().get("loginUser");
		String nickName=loginUser.getUserNickname();
		log.info("{}연결됨...:",nickName);
		userSession.put(nickName,session);
		
		
	
	}
	

	

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Member loginUser = (Member)session.getAttributes().get("loginUser");
		String nickName=loginUser.getUserNickname();
		
		//메세지 db연결...
		JsonObject obj = new JsonParser().parse(message.getPayload()).getAsJsonObject();
		String sendMessage=obj.get("message").getAsString();
		String target=obj.get("target").getAsString();//아마 사장님정보??
		
		MsgVo vo = new MsgVo();
		vo.setMsg(sendMessage);
		vo.setNick(nickName);
		vo.setTime(new Date().toLocaleString());
		
		//다른 사용자에게 메세지 전송
		sendMessageUser(target,vo);
	
	}
	
	
	private void sendMessageUser(String targetNick,MsgVo msgVo) {
		
		WebSocketSession targetSession = userSession.get(targetNick);
		
	}
	




	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
	
	}
	
	
	
	
	
}
