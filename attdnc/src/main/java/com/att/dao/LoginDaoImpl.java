package com.att.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository("LoginDao")
public class LoginDaoImpl implements LoginDaoI {
	
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public HashMap<String, Object> selectLoginInfo(HashMap<String, String> dataMap) {
		
		ArrayList<Object> queryResult = new ArrayList<Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		queryResult = (ArrayList<Object>) sqlSession.selectList("login.selectLoginInfo", dataMap);
		System.out.println("queryResult : " + queryResult.toString());
		
		result.put("result", queryResult.get(0).toString());
		
//		return (HashMap<String, Object>) sqlSession.selectList("login.selectLoginInfo", dataMap);
		return result;
	}

	/**
	 * 아이디 존재 여부 확인
	 */
	@Override
	public HashMap<String, Object> selectUserId(HashMap<String, Object> request) {
		HashMap<String, Object> queryResult = new HashMap<String, Object>(); // 쿼리 결과
		HashMap<String, Object> result = new HashMap<String, Object>(); // 데이터 리턴할 값
		
		queryResult = sqlSession.selectOne("login.selectUserId", request);
		
		if (queryResult.size() == 1) {
			result.put("result", queryResult);
			return result;
		} else {
			result.put("result", "no such data");
			return result;
		}
	}

	/**
	 * 패스워드 일치 여부 확인
	 */
	@Override
	public HashMap<String, Object> isMatchUserPw(HashMap<String, Object> request) {
		HashMap<String, Object> queryResult = new HashMap<String, Object>(); // 쿼리 결과
		HashMap<String, Object> result = new HashMap<String, Object>(); // 데이터 리턴할 값
		
		queryResult = sqlSession.selectOne("login.isMatchUserPw", request);
		
		if (queryResult.size() == 1) {
			result.put("result", queryResult);
			return result;
		} else {
			result.put("result", "no such data");
			return result;
		}
	}

	/**
	 * 승인상태조회
	 */
	@Override
	public HashMap<String, Object> selectAcptState(HashMap<String, Object> request) {
		return sqlSession.selectOne("login.selectAcptState", request);
	}

	@Override
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> request) {
		return sqlSession.selectOne("login.getUserInfo", request);
	}
}
