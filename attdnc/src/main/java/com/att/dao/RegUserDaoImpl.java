package com.att.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("RegUserDao")
public class RegUserDaoImpl implements RegUserDaoI {
	@Autowired
	SqlSession sqlSession;

	@Override
	public HashMap<String, Object> chkUserId(HashMap<String, Object> request) {
		return sqlSession.selectOne("register.chkUserId", request);
	}
	
	@Override
	public HashMap<String, Object> getCorpNoByName(HashMap<String, Object> param) {
		return sqlSession.selectOne("register.getCorpNoByName", param);
	}

	@Override
	public int regUser(HashMap<String, Object> request) {
		return sqlSession.insert("register.regUser", request);
	}

}