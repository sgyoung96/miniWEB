package com.att.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.att.service.AcptUserServiceI;

@Controller
@RequestMapping(value="acpt")
public class AcptUserController {

	@Autowired
	AcptUserServiceI acptUserServiceI;
	
	// 화면 이동
	@RequestMapping(value="acptUser")
	public ModelAndView goPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main/acptUser");
		
		System.out.println("main > acptUser Page!");
		
		return mv;
	}
	
	// 권한별 승인 대기 상태 목록 뿌리기
	@ResponseBody
	@RequestMapping(value="getAcptYetUserList")
	public HashMap<String, Object> getAcptYetUserList(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> loginInfo = (HashMap<String, Object>) request.getSession().getAttribute("loginInfo");
		String authCd = loginInfo.get("AUTH_CD").toString();
		param.put("CORP_NO", loginInfo.get("CORP_NO").toString());
		
		if (!authCd.equals("B01") && !authCd.equals("B02")) {
			resultMap.put("RES_CD", "001");
			resultMap.put("RES_MSG", "해당 페이지에 관한 접근 권한이 없습니다.");
			
			return resultMap;
		} else {
			if (authCd.equals("B01")) { // 서비스관리자면, 기업별 최고관리자 목록 뿌리기
				param.put("targetauthCd", "B02");
			} else if (authCd.equals("B02")) { // 기업별 최고관리자라면, 모든 가입 신청 목록 뿌리기
				param.put("targetauthCd", "B04");
			}
			
			List<Object> resHttp = acptUserServiceI.getAcptYetUserList(param);
			System.out.println("resHttp : " + resHttp);
			
			if (resHttp.size() > 0) {
				resultMap.put("userList", resHttp);
				resultMap.put("RES_CD", "000");
			} else {
				resultMap.put("RES_CD", "002");
				resultMap.put("RES_MSG", "승인 대기 목록이 조회되지 않았습니다.");
			}
			
			return resultMap;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="updateUserAcptType")
	public HashMap<String, Object> updateUserAcptType(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			int count = acptUserServiceI.updateUserAcptType(param);
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
}