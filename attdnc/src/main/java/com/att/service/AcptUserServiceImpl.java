package com.att.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.att.dao.AcptUserDaoI;

@Service("AcptUserService")
public class AcptUserServiceImpl implements AcptUserServiceI {

	@Autowired
	AcptUserDaoI acptUserDao;

	// 권한별 승인 대기 상태 목록 뿌리기
	@Override
	public List<Object> getAcptYetUserList(HashMap<String, Object> param) {
		return acptUserDao.getAcptYetUserList(param);
	}
	
	// 승인상태 업데이트 하기
	@Override
	public int updateUserAcptType(HashMap<String, Object> param) {
		return acptUserDao.updateUserAcptType(param);
	}
	

}
