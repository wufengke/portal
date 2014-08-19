package com.cyou.login.service;

import com.cyou.infor.bean.ApplyTeach;



public interface ApplyTeachService{

	ApplyTeach getApplyTeachByUserId(String userId);

	boolean saveApplyTeach(ApplyTeach at);
	
}
