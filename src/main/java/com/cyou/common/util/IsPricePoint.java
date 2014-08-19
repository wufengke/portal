package com.cyou.common.util;

public enum IsPricePoint {
	
	NO_PRICE_POINT(0,"无费点"),ISCARD(1,"有费点");
	
	private int status;
	
	private String statusDesc;
	
	private IsPricePoint(int status,String statusDesc){
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
