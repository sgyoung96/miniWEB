package com.att.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.att.service.VacationServiceI;

@Controller
@RequestMapping(value="vacation")
public class VacationController {

	@Autowired
	VacationServiceI vacationServiceI;
	
	//휴가생성요청 화면 이동
	@RequestMapping(value="vacationManage")
	public ModelAndView vacationManage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main/vacationManage");
		
		List<String> monthList = new ArrayList<String>();
		for (int i=1; i<=12; i++) {
			
			String str = "";
			
			if (i < 10) {
				str = "0"+ i;
			} else {
				str = ""+i;
			}
			
			monthList.add(str);
		}
		
		List<String> dayList = new ArrayList<String>();
		for (int i=1; i<=31; i++) {
			
			String str = "";
			
			if (i < 10) {
				str = "0"+ i;
			} else {
				str = ""+i;
			}
			
			dayList.add(str);
		}
		
		mv.addObject("monthList", monthList);
		mv.addObject("dayList", dayList);
		
		return mv;
	}
	
	//휴가생성
	@ResponseBody
	@RequestMapping(value="regVaction")
	public Object regVaction(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			HashMap<String, Object> loginInfo = (HashMap<String, Object>) request.getSession().getAttribute("loginInfo");
			
			param.put("USER_NO", loginInfo.get("USER_NO").toString());
			param.put("CORP_NO", loginInfo.get("CORP_NO").toString());
			
			// 휴가신청
			int result = vacationServiceI.insertRegVacation(param);
			
			if  (result != 1) {
				resultMap.put("RES_CD", "001");
				resultMap.put("RES_MSG", "휴가신청에 실패하였습니다.");
			} else {
				resultMap.put("RES_CD", "000");
				resultMap.put("RES_MSG", "휴가신청에 성공하였습니다.");
			}
			
			return resultMap;
			
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("RES_CD","444");
			return resultMap;
		}
	}
	
	//휴가신청승인 화면 이동
	@RequestMapping(value="vacationApprovalManage")
	public ModelAndView vacationApprovalManage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main/vacationApprovalManage");
		
//		HashMap<String, Object> params = new HashMap<String, Object>();
//
//		List<HashMap<String, Object>> approvalList = vacationServiceI.selectApprovalList(params);
//		mv.addObject("approvalList", approvalList);
		
		return mv;
	}
	

	// 권한별 승인 대기 상태 목록 뿌리기
	@ResponseBody
	@RequestMapping(value="getVacationList")
	public HashMap<String, Object> getVacationList(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> loginInfo = (HashMap<String, Object>) request.getSession().getAttribute("loginInfo");
		String authCd = loginInfo.get("AUTH_CD").toString();
		param.put("CORP_NO", loginInfo.get("CORP_NO"));
		
		if (!authCd.equals("B03")) {
			resultMap.put("RES_CD", "001");
			resultMap.put("RES_MSG", "해당 페이지에 관한 접근 권한이 없습니다.");
			
			return resultMap;
		} else { // 부서장 등급만 휴가 승인 가능
			List<Object> resHttp = vacationServiceI.getApprovalList(param);
			
			if (resHttp.size() > 0) {
				resultMap.put("userList", resHttp);
				resultMap.put("RES_CD", "000");
			} else {
				resultMap.put("RES_CD", "002");
				resultMap.put("RES_MSG", "권한 상승 가능한 인원이 존재하지 않습니다.");
			}
			
			return resultMap;
		}
	}
	
	// 휴가승인
	@ResponseBody
	@RequestMapping(value="acptVacation")
	public HashMap<String, Object> acptVacation(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int count = vacationServiceI.acptVacation(param);
			if (count > 0) {
				resultMap.put("RES_CD", "000");
				resultMap.put("RES_MSG", "승인상태 변경이 반영되었습니다.");
			} else {
				resultMap.put("RES_CD", "444");
				resultMap.put("RES_MSG", "승인상태 변경이 실패하였습니다.");
			}
			
			return resultMap;
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("RES_CD", "999");
			resultMap.put("RES_MSG", "승인상태 변경이 실패하였습니다.");
			return resultMap;
		}
	}
}