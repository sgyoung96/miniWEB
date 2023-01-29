package com.att.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("AdminPageDao")
public class AdminPageDaoImpl implements AdminPageDaoI {
	@Autowired
	SqlSession sqlSession;

	// 모든 회사의 사원 목록 조회
	@Override
	public List<Object> getAllUserByCorp(HashMap<String, Object> param) {
		return sqlSession.selectList("admin.getAllUserByCorp", param);
	}

	// 권한 상승
	@Override
	public int updateUserAuthType(HashMap<String, Object> param) {
		return sqlSession.update("admin.updateUserAuthType", param);
	}

	
}