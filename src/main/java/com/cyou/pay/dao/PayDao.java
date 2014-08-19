package com.cyou.pay.dao;

import java.util.List;

import com.cyou.core.dao.BaseDao;
import com.cyou.infor.model.UserOrderModel;

public interface PayDao extends BaseDao{

	List<UserOrderModel> getOrderByUserId(String userId);

	Long getCanceledOrderCountByUserId(String userId);

	Long getNotPaidOrderCountByUserId(String userId);

	Long getPaidOrderCountByUserId(String userId);

	Long getRefundOrderCountByUserId(String userId);

}
