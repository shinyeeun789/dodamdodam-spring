package com.inhatc.domain;

public class UserVO {
	private String userID;
	private String userPassword;
	private String userName;
	private String allergyType;
	private String loginType;

	@Override
	public String toString() {
		return "UserVO [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName
				+ ", allergyType=" + allergyType + ", loginType=" + loginType + "]";
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

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
}