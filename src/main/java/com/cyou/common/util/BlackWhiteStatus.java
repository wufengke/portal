package com.cyou.common.util;

public enum BlackWhiteStatus {
    NORMAL(0,"正常"),WHITE(1,"白名单"),BLACK(-1,"黑名单");
	
	private int status;
	
	private String statusDesc;
	
	private BlackWhiteStatus(int status,String statusDesc){
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
