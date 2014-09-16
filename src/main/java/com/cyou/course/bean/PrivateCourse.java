package com.cyou.course.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="PRIVATE_COURSE")
public class PrivateCourse implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//自增id
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private Integer id;
	
	@Column(name="USER_ID",length=32)
	private String userId;
	
	@Column(name="COURSE_TITLE",length=255)
	private String courseTitle;
	
	@Column(name="COURSE_URL",length=512)
	private String courseUrl;
	
	@Column(name="COURSE_PASSWORD",length=32)
	private String coursePassword;

	@Column(name="STATUS")
	private Integer status;
	
	@Column(name="CREATE_TIME")
	private Date createTime;
	
	@Column(name="UPDATE_TIME")
	private Date updateTime;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public String getCourseUrl() {
		return courseUrl;
	}

	public void setCourseUrl(String courseUrl) {
		this.courseUrl = courseUrl;
	}

	public String getCoursePassword() {
		return coursePassword;
	}

	public void setCoursePassword(String coursePassword) {
		this.coursePassword = coursePassword;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
}