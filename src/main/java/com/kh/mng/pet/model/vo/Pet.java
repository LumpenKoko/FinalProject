package com.kh.mng.pet.model.vo;

import java.sql.Date;

public class Pet {
	private int petNo;
	private String petName;
	private Date petBirthday;
	private char petGender;
	private int userNo;
	private int petSizeNo;
	
	public Pet() {
		super();
	}

	public Pet(int petNo, String petName, Date petBirthday, char petGender, int userNo, int petSizeNo) {
		super();
		this.petNo = petNo;
		this.petName = petName;
		this.petBirthday = petBirthday;
		this.petGender = petGender;
		this.userNo = userNo;
		this.petSizeNo = petSizeNo;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public Date getPetBirthday() {
		return petBirthday;
	}

	public void setPetBirthday(Date petBirthday) {
		this.petBirthday = petBirthday;
	}

	public char getPetGender() {
		return petGender;
	}

	public void setPetGender(char petGender) {
		this.petGender = petGender;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPetSizeNo() {
		return petSizeNo;
	}

	public void setPetSizeNo(int petSizeNo) {
		this.petSizeNo = petSizeNo;
	}

	@Override
	public String toString() {
		return "Pet [petNo=" + petNo + ", petName=" + petName + ", petBirthday=" + petBirthday + ", petGender="
				+ petGender + ", userNo=" + userNo + ", petSizeNo=" + petSizeNo + "]";
	}
	
	
}
