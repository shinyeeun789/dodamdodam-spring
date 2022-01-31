package com.inhatc.domain;

public class DietVO {
	private int dietID;
	private String userID;
	private String dietDate;
	private String dietTime;
	private String brelupper;
	private String foodID;
	private String foodName;
	
	@Override
	public String toString() {
		return "DietVO [dietID=" + dietID + ", userID=" + userID + ", dietDate=" + dietDate + ", dietTime=" + dietTime
				+ ", brelupper=" + brelupper + ", foodID=" + foodID + "]";
	}

	public int getDietID() {
		return dietID;
	}

	public void setDietID(int dietID) {
		this.dietID = dietID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getDietDate() {
		return dietDate;
	}

	public void setDietDate(String dietDate) {
		this.dietDate = dietDate;
	}

	public String getDietTime() {
		return dietTime;
	}

	public void setDietTime(String dietTime) {
		this.dietTime = dietTime;
	}

	public String getBrelupper() {
		return brelupper;
	}

	public void setBrelupper(String brelupper) {
		this.brelupper = brelupper;
	}

	public String getFoodID() {
		return foodID;
	}

	public void setFoodID(String foodID) {
		this.foodID = foodID;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
}
