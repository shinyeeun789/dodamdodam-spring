package com.inhatc.domain;

public class UserVO {
	private String userID;
	private String userPassword;
	private String userName;
<<<<<<< HEAD
	private String allergy_type;
	private String login_type;
	private String user_type;
=======
	private String allergyType;
	private String loginType;
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac

	@Override
	public String toString() {
		return "UserVO [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName
<<<<<<< HEAD
				+ ", allergy_type=" + allergy_type + ", login_type=" + login_type + ", user_type=" + user_type + "]";
=======
				+ ", allergyType=" + allergyType + ", loginType=" + loginType + "]";
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
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

	public String getAllergy_type() {
		return allergy_type;
	}

	public void setAllergy_type(String allergy_type) {
		this.allergy_type = allergy_type;
	}

	public String getLogin_type() {
		return login_type;
	}

	public void setLogin_type(String login_type) {
		this.login_type = login_type;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
}