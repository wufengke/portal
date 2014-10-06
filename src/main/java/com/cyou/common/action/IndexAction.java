package com.cyou.common.action;


import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.jms.Session;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.common.util.DateUtils;
import com.cyou.config.bean.IndexPic;
import com.cyou.config.service.ConfigService;
import com.cyou.core.action.BaseAction;
import com.cyou.course.bean.Course;
import com.cyou.course.bean.CourseDetail;
import com.cyou.course.condition.CourseCondition;
import com.cyou.course.model.LessionScheduleJsonModel;
import com.cyou.course.model.LessionScheduleModel;
import com.cyou.course.model.OutlineJsonModel;
import com.cyou.course.service.CourseService;
import com.cyou.register.service.UsersService;
import com.google.gson.Gson;

@Controller
public class IndexAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(IndexAction.class);
	private String detailId;
	private Integer rank;
	private InputStream inputStream;
	private List<Users> usersList = null;
	@Resource
	private CourseService courseService;
	@Resource
	private UsersService usersService;
	@Resource
	private ConfigService configService;
	
	private String courseType; 
	
	private String priceType;
	
	private String startDate;
	
	private String endDate;
	
	@Action(value = "/index", results = { @Result(name = SUCCESS, location = "/index.jsp")})
	public String index(){
		try {
			List<Course> courseList = courseService.getOnlineCourseList();
			//List<Course> rollList = courseService.getRollCourseList();
			httpServletRequest.setAttribute("courseList", courseList);
			//httpServletRequest.setAttribute("rollList", rollList);
			List<IndexPic> indexPicList=configService.GetUseableIndexPic();
			httpServletRequest.setAttribute("indexPicList", indexPicList);
			System.out.println("piclistSize:"+indexPicList.size());
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/public_online", results = {
			@Result(name = SUCCESS, location = "/public_course_list.jsp"),
			@Result(name = INPUT, type="redirect",location = "/index")})
	public String publicOnline(){
		try {
			CourseCondition condition = new CourseCondition();
			condition.setCourseType(courseType);
			
			condition.setPriceType(priceType);
			
			if(StringUtils.isBlank(startDate)){
				condition.setStartTime(DateUtils.format(System.currentTimeMillis(), "yyyy-MM-dd"));
			}else{
				condition.setStartTime(startDate);
			}
			if(StringUtils.isBlank(endDate)){
				long l = System.currentTimeMillis();
				 l += 3600*1000*24*90l;
				condition.setEndTime(DateUtils.format(l, "yyyy-MM-dd"));
			}else{
				condition.setEndTime(endDate);
			}
			List<Course> courseList = courseService.getCourseByCondition(condition);
			httpServletRequest.setAttribute("courseList", courseList);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	
	
	
	@Action(value = "/detail", results = { 
			@Result(name = SUCCESS, location = "/course_detail.jsp"),
			@Result(name = INPUT, type="redirect",location = "/index")})
	public String courseDetail(){
		try {
			CourseDetail cd = courseService.getCourseDetailByDetailId(detailId);
			Course c = courseService.getCourseByDetailId(detailId);
			if(cd != null && c != null){
				//解析开课时间json
				String lessionSchedule = cd.getLessionSchedule();
				LessionScheduleJsonModel model = new Gson().fromJson(lessionSchedule, LessionScheduleJsonModel.class);
				List<LessionScheduleModel> lessionScheduleModels = model.getSchedule();
				//去除过期的时间表
				for (Iterator<LessionScheduleModel> iterator = lessionScheduleModels.iterator(); iterator.hasNext();) {
					LessionScheduleModel lessionScheduleModel = iterator.next();
					String startDate = lessionScheduleModel.getStartDate();
					String startTime = lessionScheduleModel.getStartTime();
					Date d = DateUtils.parseDate(startDate + " " + startTime, "yyyy-MM-dd HH:mm");
					if(System.currentTimeMillis() > d.getTime()){
						iterator.remove();
					}
				}
				String outline = cd.getCourseDetailOutline();
				OutlineJsonModel outlineModel = new Gson().fromJson(outline, OutlineJsonModel.class);
				//查询教师团队
				String userIds = c.getUserId();
				String[] temps = userIds.split(",");
				usersList = new ArrayList<Users>();
				for (int i = 0; i < temps.length; i++) {
					Users u = usersService.getUsersByUserId(temps[i]);
					usersList.add(u);
				}
				Account account = (Account) getFromSession("account");
				//已登录
				if(account != null){
					int b = courseService.getUserCourseByCourseIdAndRank(account.getUserId(),c.getCourseId(),0);
					if(b <= 0){
						httpServletRequest.setAttribute("buyStatus", 1);
					}else{
						//已购买
						httpServletRequest.setAttribute("buyStatus", 0);
					}
				}else{
					//可以购买
					httpServletRequest.setAttribute("buyStatus", 1);
				}
				httpServletRequest.setAttribute("cd", cd);
				httpServletRequest.setAttribute("c", c);
				httpServletRequest.setAttribute("usersList", usersList);
				httpServletRequest.setAttribute("lessionSchedule", lessionScheduleModels);
				httpServletRequest.setAttribute("outlline", outlineModel.getOutline());
			}else {
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	
	@Action(value = "/checkBuyStatus", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String checkBuyStatus(){
		try {
			String json = "{\"status\":1}";
			if(StringUtils.isBlank(detailId) || rank == null){
				inputStream = new ByteArrayInputStream(json.getBytes());
				return SUCCESS;
			}
			
			Account account = (Account) getFromSession("account");
			if(account != null){
				int b = courseService.getUserCourseByCourseIdAndRank(account.getUserId(),detailId,rank);
				if(b > 0){
					json = json.replace("1", "0");
				}
			}
			inputStream = new ByteArrayInputStream(json.getBytes());

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		return SUCCESS;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public String getDetailId() {
		return detailId;
	}
	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	
}
