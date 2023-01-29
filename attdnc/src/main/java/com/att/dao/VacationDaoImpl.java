package com.att.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("VacationDao")
public class VacationDaoImpl implements VacationDaoI {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertRegVacation(HashMap<String, Object> param) {
		return sqlSession.insert("vacation.insertRegVacation", param);
	}

	@Override
	public List<HashMap<String, Object>> selectApprovalList(HashMap<String, Object> params) {
		return sqlSession.selectList("vacation.selectApprovalList", params);
	}

	@Override
	public List<Object> getApprovalList(HashMap<String, Object> params) {
		return sqlSession.selectList("vacation.getApprovalList", params);
	}

	@Override
	public int acptVacation(HashMap<String, Object> param) {
		return sqlSession.update("vacation.acptVacation", param);
	}
}