package com.kh.mng.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ShortsReply {
	private int replyNo;
	private Date enrollDate;
	private String replyContent;
	private String replyReNo;
	private String userNickname;
	private String FilePath;
	private String changeName;

}
