package com.cyou.common.util;

public enum ChannelCheckMark {
	
	NONEED(0,"不需要"),NEED(1,"需要");
	
	private int status;
	
	private String statusDesc;
	
	private ChannelCheckMark(int status,String statusDesc){
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
