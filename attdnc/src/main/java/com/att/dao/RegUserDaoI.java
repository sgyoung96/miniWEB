package com.att.dao;

import java.util.HashMap;

public interface RegUserDaoI {
	
	// 아이디 중복 체크
	HashMap<String, Object> chkUserId(HashMap<String, Object> request);
	
	//기업 고유번호 조회
	HashMap<String, Object> getCorpNoByName(HashMap<String, Object> param);
		
	// 가입신청
	int regUser(HashMap<String, Object> request);
}
