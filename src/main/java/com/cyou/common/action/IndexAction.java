package com.cyou.common.action;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Users;
import com.cyou.core.action.BaseAction;
import com.cyou.course.bean.Course;
import com.cyou.course.bean.CourseDetail;
import com.cyou.course.model.LessionScheduleJsonModel;
import com.cyou.course.model.OutlineJsonModel;
import com.cyou.course.service.CourseService;
import com.cyou.register.service.UsersService;
import com.google.gson.Gson;

@Controller
public class IndexAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(IndexAction.class);
	private String detailId;
	private List<Users> usersList = null;
	@Resource
	private CourseService courseService;
	@Resource
	private UsersService usersService;
	
	@Action(value = "/index", results = { @Result(name = SUCCESS, location = "/index.jsp")})
	public String index(){
		try {
			List<Course> courseList = courseService.getOnlineCourseList();
			List<Course> rollList = courseService.getRollCourseList();
			httpServletRequest.setAttribute("courseList", courseList);
			httpServletRequest.setAttribute("rollList", rollList);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/detail", results = { @Result(name = SUCCESS, location = "/course_detail.jsp"),
										@Result(name = INPUT, type="redirect",location = "/index")})
	public String courseDetail(){
		try {
			CourseDetail cd = courseService.getCourseDetailByDetailId(detailId);
			Course c = courseService.getCourseByDetailId(detailId);
			if(cd != null && c != null){
				//解析开课时间json
				String lessionSchedule = cd.getLessionSchedule();
				LessionScheduleJsonModel model = new Gson().fromJson(lessionSchedule, LessionScheduleJsonModel.class);
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
				httpServletRequest.setAttribute("cd", cd);
				httpServletRequest.setAttribute("c", c);
				httpServletRequest.setAttribute("usersList", usersList);
				httpServletRequest.setAttribute("lessionSchedule", model.getSchedule());
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
	
	public String getDetailId() {
		return detailId;
	}
	public void setDetailId(String detailId) {
		this.detailId = detailId;
	}
}
