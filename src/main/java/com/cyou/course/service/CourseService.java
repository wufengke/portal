package com.cyou.course.service;

import java.util.List;

import com.cyou.course.bean.Course;
import com.cyou.course.bean.CourseDetail;
import com.cyou.course.condition.CourseCondition;
import com.cyou.course.model.UserCourseModel;



public interface CourseService{

	List<Course> getOnlineCourseList();

	CourseDetail getCourseDetailByDetailId(String detailId);

	Course getCourseByDetailId(String detailId);

	List<UserCourseModel> getUserCourseModelByUserId(String userId);

	List<Course> getTeacherCourseCourseByUserId(String userId);

	List<Course> getRollCourseList();
	
	/**
	 * 我的课程下面推荐的最新课程
	 * @return
	 */
	List<Course> getNewOnlineCourseList();
	/**
	 * 
	 * @param courseId
	 * @param string 
	 * @param i
	 */
	int getUserCourseByCourseIdAndRank(String userId, String courseId, int lessonRank);
	/**
	 * 公开课筛选列表
	 * @param condition
	 * @return
	 */
	List<Course> getCourseByCondition(CourseCondition condition);
	
}
