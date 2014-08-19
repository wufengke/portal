package com.cyou.common.util;

public enum CheckType {

	PRICE_POINT(0,"费点校验"),REG(1,"正则校验");
	
	private int status;
	
	private String statusDesc;
	
	private CheckType(int status,String statusDesc){
		this.status = status;
		this.statusDesc = statusDesc;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStatusDesc() {
		return statusDesc;
	}

	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	
}
