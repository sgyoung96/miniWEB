package com.att.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.att.dao.AcptUserDaoI;
import com.att.dao.AdminPageDaoI;

@Service("AdminPageService")
public class AdminPageServiceImpl implements AdminPageServiceI {

	@Autowired
	AdminPageDaoI adminPageDao;

	// 모든 회사의 사원 목록 조회
	@Override
	public List<Object> getAllUserByCorp(HashMap<String, Object> param) {
		return adminPageDao.getAllUserByCorp(param);
	}

	// 권한 상승
	@Override
	public int updateUserAuthType(HashMap<String, Object> param) {
		return adminPageDao.updateUserAuthType(param);
	}

	

}
