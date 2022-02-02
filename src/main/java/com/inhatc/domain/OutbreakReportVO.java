package com.inhatc.domain;

public class OutbreakReportVO {

	private String outbreakMonth;
	private int outbreakCount;
	private String type;
	private int typeCount;
	private int maxCount;
	private String medicine;
	private int medicineCount;

	@Override
	public String toString() {
		return "OutbreakReportVO [outbreakMonth=" + outbreakMonth + ", outbreakCount=" + outbreakCount + ", type="
				+ type + ", typeCount=" + typeCount + ", maxCount=" + maxCount + ", medicine=" + medicine
				+ ", medicineCount=" + medicineCount + "]";
	}

	public String getOutbreakMonth() {
		return outbreakMonth;
	}

	public void setOutbreakMonth(String outbreakMonth) {
		this.outbreakMonth = outbreakMonth;
	}

	public int getOutbreakCount() {
		return outbreakCount;
	}

	public void setOutbreakCount(int outbreakCount) {
		this.outbreakCount = outbreakCount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTypeCount() {
		return typeCount;
	}

	public void setTypeCount(int typeCount) {
		this.typeCount = typeCount;
	}

	public int getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}

	public int getMedicineCount() {
		return medicineCount;
	}

	public void setMedicineCount(int medicineCount) {
		this.medicineCount = medicineCount;
	}
	
}
