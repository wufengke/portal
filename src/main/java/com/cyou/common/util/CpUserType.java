package com.cyou.common.util;
/**
 * 
 * @author wufengke
 *
 */
public enum CpUserType {
	
	/**可用状态控制**/
	CP(0,"CP用户体系"),MOBO(1,"MOBO用户体系"),NO(2,"没有用户体系");
	
	private int status;
	
	private String statusDesc;
	
	private CpUserType(int status,String statusDesc){
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
