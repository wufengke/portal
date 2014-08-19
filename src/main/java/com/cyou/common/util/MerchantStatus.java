package com.cyou.common.util;

public enum MerchantStatus {
	
	/**可用状态控制**/
	DISCARD(-2,"废弃"),DISABLE(-1,"审核不通过"),NOTVERIFY(0,"未审核"),ENABLE(1,"审核通过"),MODVERIFY(2,"审核修改");
	
	private int status;
	
	private String statusDesc;
	
	private MerchantStatus(int status,String statusDesc){
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
