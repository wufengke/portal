package com.cyou.common.util;

public enum IsCard {
	
	NOTCARD(0,"非点卡"),ISCARD(1,"点卡"),SMS(2,"短代");
	
	private int status;
	
	private String statusDesc;
	
	private IsCard(int status,String statusDesc){
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
