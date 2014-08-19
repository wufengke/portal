package com.cyou.pay.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.infor.model.UserOrderModel;
import com.cyou.pay.bean.UserOrder;
import com.cyou.pay.dao.PayDao;
import com.cyou.pay.service.PayService;
@Service
@Transactional
public class PayServicempl  implements PayService{

	private static Logger logger = Logger.getLogger(PayServicempl.class);

	@Resource
	private PayDao payDao;
	@Override
	public boolean saveOrder(UserOrder order) {
		try {
			payDao.save(order);
			return true;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return false;
		}
	}
	@Override
	public List<UserOrderModel> getOrderByUserId(String userId) {
		try {
			return payDao.getOrderByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return new ArrayList<UserOrderModel>();
		}
	}
	@Override
	public Long getCanceledOrderCountByUserId(String userId) {
		try {
			return payDao.getCanceledOrderCountByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return 0l;
		}
	}
	@Override
	public Long getNotPaidOrderCountByUserId(String userId) {
		try {
			return payDao.getNotPaidOrderCountByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return 0l;
		}
	}
	@Override
	public Long getPaidOrderCountByUserId(String userId) {
		try {
			return payDao.getPaidOrderCountByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return 0l;
		}
	}
	@Override
	public Long getRefundOrderCountByUserId(String userId) {
		try {
			return payDao.getRefundOrderCountByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return 0l;
		}
	}

}
