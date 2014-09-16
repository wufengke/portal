package com.cyou.course.condition;

import java.io.Serializable;

public class CourseCondition implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 *  <li class="on" mid="-1">全部</li>
                <li mid="1">大学</li>
                <li mid="2">高中</li>
                <li mid="3">中学</li>
                <li mid="4">小学</li>
                <li mid="5">外语</li>
                <li mid="6">素质教育</li>
	 */
	private String courseType; 
	
	private String priceType;
	
	private String startTime;
	
	private String endTime;

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public String getPriceType() {
		return priceType;
	}

	public void setPriceType(String priceType) {
		this.priceType = priceType;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}
