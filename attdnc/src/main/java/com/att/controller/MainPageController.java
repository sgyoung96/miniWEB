package com.att.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.att.service.MainPageServiceI;

@Controller
@RequestMapping(value="main")
public class MainPageController {

	@Autowired
	MainPageServiceI mainPageServiceI;
	
	// 화면 이동
	@RequestMapping(value="mainPage")
	public ModelAndView goMain(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main/main");
		
		System.out.println("mainPage!");
		
		return mv;
	}
	
	// 메인 화면 이름 찍기
	@ResponseBody
	@RequestMapping(value="initUserInfo")
	public Object chkCorpNo(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			HashMap<String, Object> loginInfo = (HashMap<String, Object>) request.getSession().getAttribute("loginInfo");
			
//			// test
//			String userNo = loginInfo.get("USER_NO").toString();
//			System.out.println("userNo : " + userNo);
			
			String userNm = loginInfo.get("USER_NM").toString();
			resultMap.put("RES_CD","000");
			resultMap.put("USER_NM", userNm);
			
			return resultMap;
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("RES_CD","444");
			return resultMap;
		}
	}
	
	// 로그아웃
	@ResponseBody
	@RequestMapping(value="logout")
	public Object logout(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		HashMap<String, Object> loginInfo = (HashMap<String, Object>) request.getSession().getAttribute("loginInfo");
		request.getSession().removeAttribute("loginInfo");
		
		resultMap.put("RES_MSG", "로그아웃 되었습니다.");
		return resultMap;
	}
	
	
	// 출/퇴근
	@ResponseBody
	@RequestMapping(value="insertWork")
	public Object insertWork(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			HashMap<String, Object> loginInfo = (HashMap<String, Object>) request.getSession().getAttribute("loginInfo");

			String userNo = loginInfo.get("USER_NO").toString();
			String corpNo = loginInfo.get("CORP_NO").toString();
			
			param.put("USER_NO", userNo);
			param.put("CORP_NO", corpNo);
			
			String statCd = param.get("ATT_STAT_CD").toString();
			
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			Calendar now = Calendar.getInstance();
			
			
			String nowTime = sdf1.format(now.getTime());
			
			param.put("NOW_TIME", nowTime);
			
			if ("1".equals(statCd)) {
				int vacationYn = mainPageServiceI.selectVacationCnt(param);
				
				if (vacationYn > 0) {
					resultMap.put("RES_CD","001");
					resultMap.put("RES_MSG", "휴가가 있습니다.");
					
					return resultMap;
				}
				
				int hour = now.get(Calendar.HOUR);
				
				if (hour > 9) {
					statCd = "3"; // 지각
					param.put("ATT_STAT_CD", statCd);
				}
			} else {
				int vacationYn = mainPageServiceI.selectVacationCnt(param);
				
				if (vacationYn > 0) {
					resultMap.put("RES_CD","001");
					resultMap.put("RES_MSG", "휴가가 있습니다.");
					
					return resultMap;
				}
			}
			
			System.out.println("insert param: " + param);
			
			int result = mainPageServiceI.insertAttdnc(param);
			
			if  (result != 1) {
				resultMap.put("RES_CD", "001");
				resultMap.put("RES_MSG", "근태기록에 실패하였습니다.");
			} else {
				resultMap.put("RES_CD", "000");
				resultMap.put("RES_MSG", "근태기록에 성공하였습니다.");
			}
			
			return resultMap;
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("RES_CD","444");
			return resultMap;
		}
	}
}