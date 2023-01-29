package com.att.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.att.dao.MainPageDaoI;
import com.att.dao.RegCorpDaoI;

@Service("MainPageService")
public class MainPageServiceImpl implements MainPageServiceI {

	@Autowired
	MainPageDaoI mainPageDao;

	@Override
	public int selectVacationCnt(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return mainPageDao.selectVacationCnt(param);
	}

	@Override
	public int insertAttdnc(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return mainPageDao.insertAttdnc(param);
	}
	

}
