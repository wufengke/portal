package com.cyou.common.util;
/**
 * 
 * @author wufengke
 *
 */
public enum ChannelStrategyRule {
	
	/**可用状态控制**/
	OFF(0,"关闭策略"),RULE_RATE(1,"费率优先"),RULE_SEQUENCE(2,"排序优先");
	
	private int status;
	
	private String statusDesc;
	
	private ChannelStrategyRule(int status,String statusDesc){
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
