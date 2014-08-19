package com.cyou.infor.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.infor.service.InforService;
@Service
@Transactional
public class InforServiceImpl  implements InforService{

	private static Logger logger = Logger.getLogger(InforServiceImpl.class);
}
