package com.cyou.login.dao;

import com.cyou.core.dao.BaseDao;
import com.cyou.infor.bean.ApplyTeach;

public interface ApplyTeachDao extends BaseDao{

	ApplyTeach getApplyTeachByUserId(String userId);

}
