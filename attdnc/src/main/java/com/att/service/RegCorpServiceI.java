package com.att.service;

import java.util.HashMap;

public interface RegCorpServiceI {

	// 사업자등록번호 중복 체크
	HashMap<String, Object> selectChkCorpNoCount(HashMap<String, Object> param);
	
	// 관리자정보 (- 유저 테이블) 중복 체크
	HashMap<String, Object> selectAdminUserIdChkCount(HashMap<String, Object> param);

	//기업회원가입 
	int insertRegCorp(HashMap<String, Object> param);
	
	//기업 고유번호 조회
	HashMap<String, Object> getCorpNo(HashMap<String, Object> param);
	
	//기업관리자 정보 추가 (- 유저 테이블)
	int insertRegAdmin(HashMap<String, Object> param);
	
}
