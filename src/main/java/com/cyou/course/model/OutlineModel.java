package com.cyou.course.model;

import java.io.Serializable;

public class OutlineModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String lessionTitle;
	
	private String lessionTime;

	public String getLessionTitle() {
		return lessionTitle;
	}

	public void setLessionTitle(String lessionTitle) {
		this.lessionTitle = lessionTitle;
	}

	public String getLessionTime() {
		return lessionTime;
	}

	public void setLessionTime(String lessionTime) {
		this.lessionTime = lessionTime;
	}
	
	

}
