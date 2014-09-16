package com.cyou.infor.dao;

import com.cyou.core.dao.BaseDao;
import com.cyou.course.bean.PrivateCourse;

public interface InforDao extends BaseDao{

	PrivateCourse getPrivateCourseByUserId(String userId);

}
