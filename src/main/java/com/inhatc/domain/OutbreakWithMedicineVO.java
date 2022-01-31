package com.inhatc.domain;

public class OutbreakWithMedicineVO {
	private String userID;
	private String outbreakDate;
	private String outbreakTime;
	private String medicineTime;
	private String type;
	private String bodyPart;
	private String medicine;
	private String medicineInfo;
	
	@Override
	public String toString() {
		return "OutbreakWithMedicineVO [userID=" + userID + ", outbreakDate=" + outbreakDate + ", outbreakTime="
				+ outbreakTime + ", medicineTime=" + medicineTime + ", type=" + type + ", bodyPart=" + bodyPart
				+ ", medicine=" + medicine + ", medicineInfo=" + medicineInfo + "]";
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getOutbreakDate() {
		return outbreakDate;
	}
	public void setOutbreakDate(String outbreakDate) {
		this.outbreakDate = outbreakDate;
	}
	public String getOutbreakTime() {
		return outbreakTime;
	}
	public void setOutbreakTime(String outbreakTime) {
		this.outbreakTime = outbreakTime;
	}
	public String getMedicineTime() {
		return medicineTime;
	}
	public void setMedicineTime(String medicineTime) {
		this.medicineTime = medicineTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBodyPart() {
		return bodyPart;
	}
	public void setBodyPart(String bodyPart) {
		this.bodyPart = bodyPart;
	}
	public String getMedicine() {
		return medicine;
	}
	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
	public String getMedicineInfo() {
		return medicineInfo;
	}
	public void setMedicineInfo(String medicineInfo) {
		this.medicineInfo = medicineInfo;
	}
}
