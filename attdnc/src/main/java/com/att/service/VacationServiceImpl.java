package com.att.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.att.dao.AcptUserDaoI;
import com.att.dao.VacationDaoI;

@Service("VacationService")
public class VacationServiceImpl implements VacationServiceI {

	@Autowired
	VacationDaoI vacationDao;

	@Override
	public int insertRegVacation(HashMap<String, Object> param) {
		return vacationDao.insertRegVacation(param);
	}

	@Override
	public List<HashMap<String, Object>> selectApprovalList(HashMap<String, Object> params) {
		return vacationDao.selectApprovalList(params);
	}

	@Override
	public List<Object> getApprovalList(HashMap<String, Object> params) {
		return vacationDao.getApprovalList(params);
	}

	@Override
	public int acptVacation(HashMap<String, Object> param) {
		return vacationDao.acptVacation(param);
	}
}
