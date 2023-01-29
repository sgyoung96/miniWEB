package com.att.controller;

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

import com.att.service.RegUserServiceI;

@Controller
@RequestMapping(value="regUser")
public class RegUserController {

	@Autowired
	RegUserServiceI regUserServiceI;
	
	// 화면 이동
	@RequestMapping(value="regUserManage")
	public ModelAndView goRegUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("register/reg_user");
		
		System.out.println("regUserManage!");
		
		return mv;
	}
	
	// 아이디 중복체크
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="chkUserId")
	public int chkUserId(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> resUserId = new HashMap<String, Object>();
		resUserId = regUserServiceI.chkUserId(param);
		int cntUserId = Integer.parseInt(resUserId.get("USER_CNT").toString());
		
		return cntUserId;
	}
	
	// 기업 고유번호 조회
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="getCorpNo")
	public HashMap<String, Object> getCorpNo(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		if (regUserServiceI.getCorpNoByName(param) == null) {
			resultMap.put("CORP_NO", "");
		} else {
			resultMap.put("CORP_NO", regUserServiceI.getCorpNoByName(param).get("CORP_NO"));
		}
		
		return resultMap;
	}
	
	// 회원가입신청
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="regUser")
	public Object regUser(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// 아이디 중복체크
		HashMap<String, Object> reqChkId = new HashMap<String, Object>();
		reqChkId.put("USER_ID", param.get("USER_ID"));
		int userCnt = chkUserId(request, response, reqChkId);
		
		if (userCnt >= 1) {
			resultMap.put("RES_CD", "001");
			resultMap.put("RES_MSG", "이미 사용중인 아이디입니다.");
			return resultMap;
		} else {
			// 기업 고유번호 조회
			HashMap<String, Object> reqCorpNo = new HashMap<String, Object>();
			reqCorpNo.put("CORP_NM", param.get("CORP_NM"));
			HashMap<String, Object> corp_no = getCorpNo(request, response, reqCorpNo);
			
			if (corp_no.get("CORP_NO").toString().length() == 0) {
				resultMap.put("RES_CD", "002");
				resultMap.put("RES_MSG", "업체 등록을 먼저 해주세요.");
				return resultMap;
			} else {
				param.put("CORP_NO", corp_no.get("CORP_NO"));
				int resCnt = regUserServiceI.regUser(param);
				
				if  (resCnt != 1) {
					resultMap.put("RES_CD", "003");
					resultMap.put("RES_MSG", "가입신청에 실패하였습니다.");
				} else {
					resultMap.put("RES_CD", "000");
					resultMap.put("RES_MSG", "가입신청에 성공하였습니다.");
				}
				
				return resultMap;
			}			
		}
	}
}