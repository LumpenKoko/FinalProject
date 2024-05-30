package com.kh.mng.location.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewInfo {
	   int userNo;
	   int locationNo;
	   int reviewNo;
       int starCount;
       String content;
       String type;
       
}
