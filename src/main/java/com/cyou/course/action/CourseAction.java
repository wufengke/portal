package com.cyou.course.action;


import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.common.util.DateUtils;
import com.cyou.core.action.BaseAction;
import com.cyou.course.bean.Course;
import com.cyou.course.model.LessionScheduleJsonModel;
import com.cyou.course.model.LessionScheduleModel;
import com.cyou.course.model.UserCourseModel;
import com.cyou.course.service.CourseService;
import com.google.gson.Gson;

@Controller
@Namespace(value="/member")
public class CourseAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(CourseAction.class);
	private Integer id;
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
			}else{
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
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
	
}