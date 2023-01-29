package com.att.service;

import java.util.HashMap;
import java.util.List;

public interface VacationServiceI {

	int insertRegVacation(HashMap<String, Object> param);

	List<HashMap<String, Object>> selectApprovalList(HashMap<String, Object> params);
	
	List<Object>getApprovalList(HashMap<String, Object> params);
	
	int acptVacation(HashMap<String, Object> param);
}