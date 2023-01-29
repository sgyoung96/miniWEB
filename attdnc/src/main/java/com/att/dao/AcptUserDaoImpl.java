package com.att.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("AcptUserDao")
public class AcptUserDaoImpl implements AcptUserDaoI {
	@Autowired
	SqlSession sqlSession;

	// 권한별 승인 대기 상태 목록 뿌리기
	@Override
	public List<Object> getAcptYetUserList(HashMap<String, Object> param) {
		return sqlSession.selectList("acptUser.getAcptYetUserList", param);
	}
	
	// 승인상태 업데이트 하기
	@Override
	public int updateUserAcptType(HashMap<String, Object> param) {
		return sqlSession.update("acptUser.updateUserAcptType", param);
	}
}