package com.kh.mng.community.model.dto;

import java.util.ArrayList;

import com.kh.mng.common.model.vo.PageInfo;
import com.kh.mng.community.model.vo.CommunityBoard;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardInfo {
   private int  boardCategoryNo;
   private String boardContent;
   private int userNo;
   private int boardNo;
}
