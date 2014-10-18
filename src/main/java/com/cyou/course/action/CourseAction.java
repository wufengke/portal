package com.cyou.course.action;


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
import com.cyou.base.bean.Users;
import com.cyou.common.util.DateUtils;
import com.cyou.core.action.BaseAction;
import com.cyou.course.bean.Course;
import com.cyou.course.bean.PrivateCourse;
import com.cyou.course.model.LessionScheduleJsonModel;
import com.cyou.course.model.LessionScheduleModel;
import com.cyou.course.model.UserCourseModel;
import com.cyou.course.service.CourseService;
import com.cyou.infor.bean.ApplyTeach;
import com.cyou.infor.service.InforService;
import com.cyou.login.service.ApplyTeachService;
import com.google.gson.Gson;

@Controller
@Namespace(value="/member")
public class CourseAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CourseAction.class);
	private Integer id;
	private String teachType;
	private String subject;
	private String startDate;
	private String startTime;
	private String endTime;
	private String courseName;
	private String courseBrief;
	
	@Resource
	private CourseService courseService;
	@Action(value = "/my_course", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/course/my_course.jsp"),
			@Result(name = INPUT, type="redirect",location = "/login"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String myCourse(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				//查询课程信息
				List<UserCourseModel> courseList = courseService.getUserCourseModelByUserId(account.getUserId());
				
				doAssemblyModel(courseList);
				
				List<Course> newCourseList = courseService.getNewOnlineCourseList();
				
				httpServletRequest.setAttribute("courseList", courseList);
				httpServletRequest.setAttribute("newCourseList", newCourseList);
			}else{
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Resource
	private InforService inforService;
	
	@Action(value = "/my_podium", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/course/my_podium.jsp"),
			@Result(name = INPUT, type="redirect",location = "/login")})
	public String myPodium(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				//查询课程信息
				List<Course> courseList = courseService.getTeacherCourseCourseByUserId(account.getUserId());
				httpServletRequest.setAttribute("courseList", courseList);
				PrivateCourse pc = inforService.getPrivateCourseByUserId(account.getUserId());
				if(pc != null){
					httpServletRequest.setAttribute("courseTitle", pc.getCourseTitle());
					httpServletRequest.setAttribute("code", pc.getCoursePassword());
				}
			}else{
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/my_podium_newclass", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/course/my_podium_newclass.jsp"),
			@Result(name = "MY_COURSE", type="redirect",location = "/member/my_course"),
			@Result(name = INPUT, type="redirect",location = "/login")})
	public String myPodiumNewClass(){
		
		Account account = (Account) getFromSession("account");
		
		if(account != null){
			if("0".equals(account.getAccountType())){
				return "MY_COURSE";
			}
			PrivateCourse pc = inforService.getPrivateCourseByUserId(account.getUserId());
			if(pc != null){
				httpServletRequest.setAttribute("courseTitle", pc.getCourseTitle());
				httpServletRequest.setAttribute("code", pc.getCoursePassword());
			}
		}else{
			return INPUT;
		}
		
		return SUCCESS;
	}
	@Resource
	private ApplyTeachService applyTeachService;
	@Action(value = "/my_podium_newclass_add", results = { 
			@Result(name = SUCCESS, type="redirect",location = "/member/my_podium_newclass?info=s"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, location = "/WEB-INF/page/course/my_podium_newclass.jsp")})
	public String myPodiumNewClassAdd(){
		
		Account account = (Account) getFromSession("account");
		Users user = (Users) getFromSession("user");
		if(account != null){
			ApplyTeach at = new ApplyTeach();
			at.setUserId(account.getAccountId());
			at.setTeachType(teachType);
			at.setSubject(subject);
			at.setStartDate(startDate);
			at.setStartTime(startTime);
			at.setEndTime(endTime);
			at.setCourseName(courseName);
			at.setCourseBrief(courseBrief);
			at.setRealName(user.getRealName());
			at.setAge(0);
			at.setGender(user.getSex());
			at.setSchoolId(user.getSchoolId());
			at.setStage(user.getStage());
			at.setTeachYears(user.getTeachYear());
			at.setStatus(0);
			at.setTeacherTitle(user.getTeacherTitle());
			at.setPhone(user.getPhone());
			at.setEmail(account.getUsername());
			at.setQq(user.getQq());
			Date d = new Date();
			at.setCreateTime(d);
			at.setUpdateTime(d);
			applyTeachService.saveApplyTeach(at);
		}else{
			return LOGIN;
		}
		
		return SUCCESS;
	}

	public void validateMyPodiumNewClassAdd() {
		super.validate();
		
		if(StringUtils.isBlank(teachType)){
			this.addFieldError("teachType_error1", "请选择授课方式");
		}
		if(StringUtils.isBlank(subject)){
			this.addFieldError("subject_error1", "请选择试讲科目");
		}
		if(StringUtils.isBlank(startDate)){
			this.addFieldError("startDate_error1", "请选择试讲日期");
		}
		if(StringUtils.isBlank(startTime)){
			this.addFieldError("startDate_error1", "请选择试讲开始时间");
		}
		if(StringUtils.isBlank(endTime)){
			this.addFieldError("startDate_error1", "请选择试讲结束时间");
		}
		if(StringUtils.isBlank(courseName)){
			this.addFieldError("courseName_error1", "请选择试讲课程名称");
		}
		if(StringUtils.isNotBlank(courseName) && courseName.trim().length() > 255){
			this.addFieldError("courseName_error1", "试讲课程名称应在1~255字符之间");
		}
	}
	private void doAssemblyModel(List<UserCourseModel> courseList) {
		for (Iterator<UserCourseModel> iterator = courseList.iterator(); iterator.hasNext();) {
			UserCourseModel userCourseModel = iterator.next();
			LessionScheduleJsonModel lessionScheduleJsonModel = new Gson().fromJson(userCourseModel.getLessionSchedule(), LessionScheduleJsonModel.class);
			List<LessionScheduleModel> lessionScheduleModels = lessionScheduleJsonModel.getSchedule();
			userCourseModel.setLessionCount(lessionScheduleModels.size());
			for(int i= 0 ; i < lessionScheduleModels.size() ; i++){
				LessionScheduleModel model = lessionScheduleModels.get(i);
				if(model.getRank().equals(userCourseModel.getLessionRank())){
					
					if(DateUtils.parseDate(model.getStartDate() + " " + model.getEndTime(), "yyyy-MM-dd HH:mm").after(new Date())){
						//课程还没结束
						userCourseModel.setIsOver(0);
						userCourseModel.setHaveLerned(0);
						StringBuilder sb = new StringBuilder();
						sb.append(model.getStartDate()).append(model.getWeek()).append(model.getStartTime()).append("-").append(model.getEndTime());
						userCourseModel.setNextLession(sb.toString());
					}else {
						//课程已经结束
						userCourseModel.setIsOver(1);
						userCourseModel.setHaveLerned(1);
					}
				}
			}
			
		}
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getTeachType() {
		return teachType;
	}

	public void setTeachType(String teachType) {
		this.teachType = teachType;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
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

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseBrief() {
		return courseBrief;
	}

	public void setCourseBrief(String courseBrief) {
		this.courseBrief = courseBrief;
	}
	
}