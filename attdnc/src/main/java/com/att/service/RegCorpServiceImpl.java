package com.att.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.att.dao.RegCorpDaoI;

@Service("RegCorpService")
public class RegCorpServiceImpl implements RegCorpServiceI {

	@Autowired
	RegCorpDaoI regCorpDao;
	
	// 사업자등록번호 중복 체크
	@Override
	public HashMap<String, Object> selectChkCorpNoCount(HashMap<String, Object> param) {
		return regCorpDao.selectChkCorpNoCount(param);
	}
	
	// 관리자정보 (- 유저 테이블) 중복 체크
	@Override
	public HashMap<String, Object> selectAdminUserIdChkCount(HashMap<String, Object> param) {
		return regCorpDao.selectAdminUserIdChkCount(param);
	}

	// 기업정보 등록 신청
	@Override
	public int insertRegCorp(HashMap<String, Object> param) {
		return regCorpDao.insertRegCorp(param);
	}

	@Override
	public HashMap<String, Object> getCorpNo(HashMap<String, Object> param) {
		return regCorpDao.getCorpNo(param);
	}

	//기업관리자 정보 추가 (- 유저 테이블)
	@Override
	public int insertRegAdmin(HashMap<String, Object> param) {
		return regCorpDao.insertRegAdmin(param);
	}


}
