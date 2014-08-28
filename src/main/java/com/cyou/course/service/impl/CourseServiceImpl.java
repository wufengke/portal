package com.cyou.course.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.course.bean.Course;
import com.cyou.course.bean.CourseDetail;
import com.cyou.course.dao.CourseDao;
import com.cyou.course.model.UserCourseModel;
import com.cyou.course.service.CourseService;
@Service
@Transactional
public class CourseServiceImpl  implements CourseService{

	private static Logger logger = Logger.getLogger(CourseServiceImpl.class);

	@Resource
	private CourseDao courseDao;
	
	@Override
	public List<Course> getOnlineCourseList() {
		try {
			return courseDao.getOnlineCourseList();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return new ArrayList<Course>();
		}
	}

	@Override
	public CourseDetail getCourseDetailByDetailId(String detailId) {
		try {
			return courseDao.getCourseDetailByDetailId(detailId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return null;
		}
	}

	@Override
	public Course getCourseByDetailId(String detailId) {
		try {
			return courseDao.getCourseByDetailId(detailId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return null;
		}
	}

	@Override
	public List<UserCourseModel> getUserCourseModelByUserId(String userId) {
		try {
			return courseDao.getUserCourseModelByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return new ArrayList<UserCourseModel>();
		}
	}

	@Override
	public List<Course> getTeacherCourseCourseByUserId(String userId) {
		try {
			return courseDao.getTeacherCourseCourseByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return new ArrayList<Course>();
		}
	}

	@Override
	public List<Course> getRollCourseList() {
		try {
			return courseDao.getRollCourseList();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return new ArrayList<Course>();
		}
	}

	@Override
	public List<Course> getNewOnlineCourseList() {
		try {
			return courseDao.getNewOnlineCourseList();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return new ArrayList<Course>();
		}
	}

	@Override
	public int getUserCourseByCourseIdAndRank(String userId, String courseId,
			int lessonRank) {
		try {
			Long l = courseDao.getUserCourseByCourseIdAndRank(userId,courseId,lessonRank);
			if(l == null){
				return 0;
			}else{
				return l.intValue();
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return 0;
		}
	}

}
