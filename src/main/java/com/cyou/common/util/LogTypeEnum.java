package com.cyou.common.util;

public enum LogTypeEnum {
	INSERT("添加"),DELETE("删除"),UPDATE("修改");
	
	private String desc;
	private LogTypeEnum(String desc){
		this.desc = desc;
	}
	public String getDesc() {
		return desc;
	}
	public static void main(String[] args) {
		System.out.println(LogTypeEnum.values()[0]);
	}
}
