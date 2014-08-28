package com.cyou.pay.action;


import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.common.util.DateUtils;
import com.cyou.common.util.UUIDUtil;
import com.cyou.core.action.BaseAction;
import com.cyou.course.bean.Course;
import com.cyou.course.bean.CourseDetail;
import com.cyou.course.model.LessionScheduleJsonModel;
import com.cyou.course.model.LessionScheduleModel;
import com.cyou.course.service.CourseService;
import com.cyou.pay.bean.UserOrder;
import com.cyou.pay.service.PayService;
import com.google.gson.Gson;

@Controller
@Namespace(value="/pay")
public class PayAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(PayAction.class);
	
	private String courseId;
	
	private Course course;
	
	private String realName;
	
	private String phone;
	
	private String orderId;
	//which date?
	private Integer rank = 0;
	@Resource
	private CourseService courseService;
	@Resource
	private PayService payService;
	
	@Action(value = "/prepare", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/pay/prepare_topay.jsp"),
			@Result(name = LOGIN, type="redirect", location = "/login"),
			@Result(name = INPUT, type="redirect", location = "/index")})
	public String prepare(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if(StringUtils.isNotBlank(courseId)){
					course = courseService.getCourseByDetailId(courseId);
					CourseDetail cd = courseService.getCourseDetailByDetailId(courseId);
					if(course != null && cd != null){
						if(rank == null){
							rank = 0;
						}
						String courseTitle = course.getCourseTitle();
						if(StringUtils.isNotBlank(courseTitle)){
							if(courseTitle.length() >= 15){
								courseTitle = courseTitle.substring(0, 15);
								course.setCourseTitle(courseTitle + "...");
							}
						}
						LessionScheduleJsonModel lessionScheduleJsonModel = new Gson().fromJson(cd.getLessionSchedule(), LessionScheduleJsonModel.class);
						if(lessionScheduleJsonModel != null){
							List<LessionScheduleModel> models = lessionScheduleJsonModel.getSchedule();
							for (Iterator<LessionScheduleModel> iterator = models.iterator(); iterator.hasNext();) {
								LessionScheduleModel lessionScheduleModel =  iterator.next();
								if(lessionScheduleModel.getRank().equals(rank)){
									course.setCourseTime(DateUtils.parseDate(lessionScheduleModel.getStartDate(),"yyyy-MM-dd"));
								}
							}
						}
					}else {
						return INPUT;
					}
				}else {
					return INPUT;
				}
				
			}else {
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return INPUT;
		}
	
		return SUCCESS;
	}
	@Action(value = "/submit", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/pay/pay_success.jsp"),
			@Result(name = LOGIN, type="redirect", location = "/login"),
			@Result(name = INPUT, type="redirect", location = "/index"),
			@Result(name = "ORDER_DETAIL", type="redirect", location = "/member/my_order_all")})
	public String submit(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if(StringUtils.isNotBlank(courseId)){
					course = courseService.getCourseByDetailId(courseId);
					if(course != null){
						CourseDetail cd = courseService.getCourseDetailByDetailId(course.getCourseDetailId());
						//订单入库
						UserOrder order = new UserOrder();
						
						orderId = UUIDUtil.getOrderId();
						
						order.setAccountId(account.getAccountId());
						order.setAmount(course.getPrice());
						order.setCourseId(courseId);
						order.setCourseSmallImage(course.getSmallImageUrl());
						order.setCourseTitle(course.getCourseTitle());
						Date d = new Date();
						order.setCreateTime(d);
						order.setOrderId(orderId);
						order.setStatus(1);
						order.setUpdateTime(d);
						order.setUserId(account.getUserId());
						order.setRealName(realName);
						order.setPhone(phone);
						order.setLessionRank(rank==null ? 0:rank);
						order.setLessionSchedule(cd.getLessionSchedule());
						boolean b = payService.saveOrder(order);
						
						if(!b){
							return "ORDER_DETAIL";
						}
						
					}else {
						return INPUT;
					}
				}else {
					return INPUT;
				}
				
			}else {
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return INPUT;
		}
		
		return SUCCESS;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
}