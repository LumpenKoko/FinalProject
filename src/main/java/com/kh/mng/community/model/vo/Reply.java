package com.kh.mng.community.model.vo;

import java.sql.Date;

import com.kh.mng.common.model.vo.Attachment;

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
	private int replyReplyNo;
	private String replyContent;
	private String replyReplyContent;
	private Date replyCreateDate;
	private Date replyReplyCreateDate;
	private Date editDate;
	private boolean status;
	private int userNo;
	private String boardNo;
	private String shortsNo;
	private String replyReNo;
	private Attachment replyUserProfile;
}
