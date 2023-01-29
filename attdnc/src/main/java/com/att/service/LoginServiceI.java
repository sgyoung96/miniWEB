package com.att.service;

import java.util.HashMap;

public interface LoginServiceI {

	HashMap<String, Object> selectLoginInfo(HashMap<String, String> dataMap);
	
	// 아이디 중복 확인
	HashMap<String, Object> selectUserId(HashMap<String, Object> request);
		
	// 패스워드 일치 확인
	HashMap<String, Object> isMatchUserPw(HashMap<String, Object> request);
	
	// 승인 상태 조회
	HashMap<String, Object> selectAcptState(HashMap<String, Object> request);
	
	// 세션에 담을 회원 정보 조회
	HashMap<String, Object> getUserInfo(HashMap<String, Object> request);

}
