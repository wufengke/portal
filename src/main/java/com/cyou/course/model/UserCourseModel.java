package com.cyou.course.model;

import java.io.Serializable;
import java.util.Date;

public class UserCourseModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Date createTime;
	
	private String courseTitle;
	
	private Integer lessionRank;
	
	private String lessionSchedule;

	private String mediumImageUrl;

	private Integer lessionCount;

	private Integer haveLerned;

	private Integer isOver = 0;
	
	private String nextLession;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public Integer getLessionRank() {
		return lessionRank;
	}

	public void setLessionRank(Integer lessionRank) {
		this.lessionRank = lessionRank;
	}

	public String getLessionSchedule() {
		return lessionSchedule;
	}

	public void setLessionSchedule(String lessionSchedule) {
		this.lessionSchedule = lessionSchedule;
	}

	public String getMediumImageUrl() {
		return mediumImageUrl;
	}

	public void setMediumImageUrl(String mediumImageUrl) {
		this.mediumImageUrl = mediumImageUrl;
	}

	public Integer getLessionCount() {
		return lessionCount;
	}

	public void setLessionCount(Integer lessionCount) {
		this.lessionCount = lessionCount;
	}

	public Integer getHaveLerned() {
		return haveLerned;
	}

	public void setHaveLerned(Integer haveLerned) {
		this.haveLerned = haveLerned;
	}

	public Integer getIsOver() {
		return isOver;
	}

	public void setIsOver(Integer isOver) {
		this.isOver = isOver;
	}
	public String getNextLession() {
		return nextLession;
	}
	public void setNextLession(String nextLession) {
		this.nextLession = nextLession;
	}
}
