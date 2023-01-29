package com.att.service;

import java.util.HashMap;
import java.util.List;

public interface AcptUserServiceI {

	// 권한별 승인 대기 상태 목록 뿌리기
	List<Object> getAcptYetUserList(HashMap<String, Object> param);
	
	// 승인상태 업데이트 하기
	int updateUserAcptType(HashMap<String, Object> param);
	
}