package com.cyou.course.dao;

import java.util.List;

import com.cyou.core.dao.BaseDao;
import com.cyou.course.bean.Course;
import com.cyou.course.bean.CourseDetail;
import com.cyou.course.model.UserCourseModel;

public interface CourseDao extends BaseDao{

	List<Course> getOnlineCourseList();

	CourseDetail getCourseDetailByDetailId(String detailId);

	Course getCourseByDetailId(String detailId);

	List<UserCourseModel> getUserCourseModelByUserId(String userId);

	List<Course> getTeacherCourseCourseByUserId(String userId);

	List<Course> getRollCourseList();

}
