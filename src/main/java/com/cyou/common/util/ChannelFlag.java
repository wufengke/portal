package com.cyou.common.util;

public enum ChannelFlag {

	MOBILE(0,"mobile"),SDK(1,"sdk"),PC(2,"pc");
	
	private int status;
	
	private String statusDesc;
	
	private ChannelFlag(int status,String statusDesc){
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
