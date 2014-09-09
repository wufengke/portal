package com.cyou.about.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.about.bean.Feedback;
import com.cyou.about.dao.AboutDao;
import com.cyou.about.service.AboutService;
@Service
@Transactional
public class AboutServiceImpl  implements AboutService{

	private static Logger logger = Logger.getLogger(AboutServiceImpl.class);

	@Resource
	private AboutDao aboutDao;
	@Override
	public void saveFeedback(Feedback fb) {
		try {
			aboutDao.save(fb);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	
}
