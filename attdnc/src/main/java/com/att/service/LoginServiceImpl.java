package com.att.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.att.dao.LoginDaoI;



@Service("LoginService")
public class LoginServiceImpl implements LoginServiceI {
	
	@Autowired
	LoginDaoI loginDaoI;

	/**
	 * 테스트용 전체 회원 목록 조회
	 */
	@Override
	public HashMap<String, Object> selectLoginInfo(HashMap<String, String> dataMap) {
		return loginDaoI.selectLoginInfo(dataMap);
	}

	/**
	 * 아이디 존재 여부 확인
	 */
	@Override
	public HashMap<String, Object> selectUserId(HashMap<String, Object> request) {
		return loginDaoI.selectUserId(request);
	}

	/**
	 * 패스워드 일치 여부 확인
	 */
	@Override
	public HashMap<String, Object> isMatchUserPw(HashMap<String, Object> request) {
		return loginDaoI.isMatchUserPw(request);
	}

	/**
	 * 승인상태 조회
	 */
	@Override
	public HashMap<String, Object> selectAcptState(HashMap<String, Object> request) {
		return loginDaoI.selectAcptState(request);
	}

	/**
	 * 세션에 담을 회원 정보 조회
	 */
	@Override
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> request) {
		return loginDaoI.getUserInfo(request);
	}
}
