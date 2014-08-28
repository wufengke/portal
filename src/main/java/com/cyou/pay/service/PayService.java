package com.cyou.pay.service;

import java.util.List;

import com.cyou.infor.model.UserOrderModel;
import com.cyou.pay.bean.UserOrder;




public interface PayService{

	boolean saveOrder(UserOrder order);

	List<UserOrderModel> getOrderByUserId(String userId);

	Long getNotPaidOrderCountByUserId(String userId);

	Long getPaidOrderCountByUserId(String userId);

	Long getCanceledOrderCountByUserId(String userId);

	Long getRefundOrderCountByUserId(String userId);

	List<UserOrderModel> getOrderByUserIdAndStatus(String userId,int status);

	long getAllOrderCountByUserId(String userId);

	UserOrderModel getUserOrderModelByOrderId(String orderId);

	UserOrder getOrderbyOrderId(String orderId);

	void updateUserOrder(UserOrder order);

}
