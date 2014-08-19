package com.cyou.login.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.infor.bean.ApplyTeach;
import com.cyou.login.dao.ApplyTeachDao;
import com.cyou.login.service.ApplyTeachService;
@Service
@Transactional
public class ApplyTeachServicempl  implements ApplyTeachService{

	private static Logger logger = Logger.getLogger(ApplyTeachServicempl.class);

	@Resource
	private ApplyTeachDao applyTeachDao;
	
	@Override
	public ApplyTeach getApplyTeachByUserId(String userId) {
		try {
			return applyTeachDao.getApplyTeachByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public boolean saveApplyTeach(ApplyTeach at) {
		try {
			applyTeachDao.saveOrUpdate(at);
			return true;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return false;
		}
	}
}
