package com.cyou.common.util;
/**
 * 
 * @author wufengke
 *
 */
public enum IsOffline {
	
	DISABLE(0,"否"),ENABLE(1,"是");
	
	private int status;
	
	private String statusDesc;
	
	private IsOffline(int status,String statusDesc){
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
	public static void main(String[] args) {
	}
	
}
