package com.inhatc.domain;

public class UserVO {
	private String userID;
	private String userPassword;
	private String userName;
	private String allergyType;
	
	@Override
	public String toString() {
		return "UserVO [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", allergyType=" + allergyType + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAllergyType() {
		return allergyType;
	}

	public void setAllergyType(String allergyType) {
		this.allergyType = allergyType;
	}
}