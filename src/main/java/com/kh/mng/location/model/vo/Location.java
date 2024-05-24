package com.kh.mng.location.model.vo;

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
public class Location {
	private int locationNo;
	private String locationName;
	private String locationPhone;
	private String explanation;
	private double locationStar;
	private String reservationLink;
	private String businessNo;
	private String address;
	private Date enrollDate;
	private Date modifyDate;
	private boolean status;
    private int userNo;
	private int locatonCategoryNo;
	
}
