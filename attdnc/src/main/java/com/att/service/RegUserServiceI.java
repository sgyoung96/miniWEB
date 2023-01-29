package com.att.service;

import java.util.HashMap;

public interface RegUserServiceI {

	// 아이디 중복 체크
	HashMap<String, Object> chkUserId(HashMap<String, Object> dataMap);
	
	//기업 고유번호 조회
	HashMap<String, Object> getCorpNoByName(HashMap<String, Object> param);
	
	// 가입신청
	int regUser(HashMap<String, Object> dataMap);
}
