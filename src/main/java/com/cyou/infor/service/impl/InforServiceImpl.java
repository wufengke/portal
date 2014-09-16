package com.cyou.infor.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.course.bean.PrivateCourse;
import com.cyou.infor.dao.InforDao;
import com.cyou.infor.service.InforService;
@Service
@Transactional
public class InforServiceImpl  implements InforService{

	private static Logger logger = Logger.getLogger(InforServiceImpl.class);

	@Resource
	private InforDao inforDao;
	@Override
	public boolean savePrivateCourse(PrivateCourse pc) {
		try {
			inforDao.save(pc);
			return  true;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return false;
		}
	}
	@Override
	public PrivateCourse getPrivateCourseByUserId(String userId) {
		try {
			return inforDao.getPrivateCourseByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return null;
		}
	}
	@Override
	public boolean updatePrivateCourse(PrivateCourse pc) {
		try {
			inforDao.update(pc);
			return  true;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return false;
		}
	}
}
