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
public class Reply {
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private Date editDate;
	private boolean status;
	private String userNo;
	private String boardNo;
	private String shortsNo;
	private String replyReNo;
}
