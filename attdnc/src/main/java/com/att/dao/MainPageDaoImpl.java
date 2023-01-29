package com.att.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("MainPageDao")
public class MainPageDaoImpl implements MainPageDaoI {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int selectVacationCnt(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("main.selectVacationCnt", param);
	}

	@Override
	public int insertAttdnc(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSession.insert("main.insertAttdnc", param);
	}

	

}