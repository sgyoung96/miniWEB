package com.att.dao;

import java.util.HashMap;
import java.util.List;

public interface AdminPageDaoI {

	// 모든 회사의 사원 목록 조회
	List<Object> getAllUserByCorp(HashMap<String, Object> param);
	
	// 권한 상승
	int updateUserAuthType(HashMap<String, Object> param);
}
