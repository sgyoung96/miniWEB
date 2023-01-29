package com.att.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("RegCorpDao")
public class RegCorpDaoImpl implements RegCorpDaoI {
	@Autowired
	SqlSession sqlSession;

	// 사업자등록번호 중복 체크
	@Override
	public HashMap<String, Object> selectChkCorpNoCount(HashMap<String, Object> param) {
		return sqlSession.selectOne("register.selectChkCorpNoCount", param);
	}

	// 관리자정보 (- 유저 테이블) 중복 체크
	@Override
	public HashMap<String, Object> selectAdminUserIdChkCount(HashMap<String, Object> param) {
		return sqlSession.selectOne("register.selectAdminUserIdChkCount", param);
	}

	// 기업 정보 등록 신청
	@Override
	public int insertRegCorp(HashMap<String, Object> param) {
		return sqlSession.insert("register.insertRegCorp", param);
	}

	// 사업자등록번호로 기업 고유번호 들고오기
	@Override
	public HashMap<String, Object> getCorpNo(HashMap<String, Object> param) {
		return sqlSession.selectOne("register.getCorpNo", param);
	}
	
	//기업관리자 정보 추가 (- 유저 테이블)
	@Override
	public int insertRegAdmin(HashMap<String, Object> param) {
		return sqlSession.insert("register.insertRegAdmin", param);
	}

}