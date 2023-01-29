package com.att.dao;

import java.util.HashMap;
import java.util.List;

public interface VacationDaoI {

	int insertRegVacation(HashMap<String, Object> param);

	List<HashMap<String, Object>> selectApprovalList(HashMap<String, Object> params);
	
	List<Object> getApprovalList(HashMap<String, Object> params);
	
	int acptVacation(HashMap<String, Object> param);
}
