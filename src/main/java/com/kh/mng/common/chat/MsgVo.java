package com.kh.mng.common.chat;



import lombok.Data;

@Data
public class MsgVo {
	private String msg;
	private String nick;
	private String target;
	private String time;
}
