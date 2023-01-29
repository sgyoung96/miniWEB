package com.att.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.att.dao.RegUserDaoI;

@Service("RegUserService")
public class RegUserServiceImpl implements RegUserServiceI {
	
	@Autowired
	RegUserDaoI dao;

	@Override
	public HashMap<String, Object> chkUserId(HashMap<String, Object> dataMap) {
		return dao.chkUserId(dataMap);
	}

	@Override
	public HashMap<String, Object> getCorpNoByName(HashMap<String, Object> param) {
		return dao.getCorpNoByName(param);
	}
	
	@Override
	public int regUser(HashMap<String, Object> dataMap) {
		return dao.regUser(dataMap);
	}

}
