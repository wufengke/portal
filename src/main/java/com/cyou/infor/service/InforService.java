package com.cyou.infor.service;

import com.cyou.course.bean.PrivateCourse;



public interface InforService{

	boolean savePrivateCourse(PrivateCourse pc);

	PrivateCourse getPrivateCourseByUserId(String userId);

	boolean updatePrivateCourse(PrivateCourse pc);
	
}
