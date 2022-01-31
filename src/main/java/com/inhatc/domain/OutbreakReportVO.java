package com.inhatc.domain;

public class OutbreakReportVO {

	private String outbreakMonth;
	private int outbreakCount;
	
	@Override
	public String toString() {
		return "OutbreakReportVO [outbreakMonth=" + outbreakMonth + ", outbreakCount=" + outbreakCount + "]";
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
	
}
