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

import com.att.service.RegCorpServiceI;

@Controller
@RequestMapping(value="regCorp")
public class RegCorpController {

	@Autowired
	RegCorpServiceI regCorpServiceI;
	
	// 화면 이동
	@RequestMapping(value="regCorpManage")
	public ModelAndView goRegCorp(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("register/reg_corp");
		
		System.out.println("regCorpManage!");
		
		return mv;
	}

	// 사업자등록번호 중복체크
	@ResponseBody
	@RequestMapping(value="chkCorpNo")
	public Object chkCorpNo(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> resCorpNo = new HashMap<String, Object>();
		resCorpNo = regCorpServiceI.selectChkCorpNoCount(param);
		int cntCorpNo = Integer.parseInt(resCorpNo.get("CORP_CNT").toString());
		
		if (cntCorpNo >= 1) {
			resultMap.put("RES_CD", "001");
			resultMap.put("RES_MSG", "이미 등록된 업체입니다.");
		} else {
			resultMap.put("RES_CD", "000");
			resultMap.put("RES_MSG", "등록 가능한 업체입니다.");
		}
		
		return resultMap;
	}
	
	// 관리자 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="chkAdminUserId")
	public Object chkAdminUserId(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> resAdminId = new HashMap<String, Object>();
		resAdminId = regCorpServiceI.selectAdminUserIdChkCount(param);
		int cntAdminId = Integer.parseInt(resAdminId.get("USER_CNT").toString());
		
		if (cntAdminId >= 1) {
			resultMap.put("RES_CD", "001");
			resultMap.put("RES_MSG", "이미 사용중인 아이디 입니다.");
		} else {
			resultMap.put("RES_CD", "000");
			resultMap.put("RES_MSG", "사용 가능한 아이디 입니다.");
		}
		
		return resultMap;
	}
	
	// 기업회원가입신청 
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="regCorp")
	public Object regCorp(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// 기업 정보 삽입
		int countCorp = regCorpServiceI.insertRegCorp(param);
		// 기업 고유번호 조회
		HashMap<String, Object> reqCorpRegNo = new HashMap<String, Object>();
		reqCorpRegNo.put("CORP_REG_NO", param.get("CORP_REG_NO"));
		HashMap<String, Object> corp_reg_no = (HashMap<String, Object>) getCorpNo(request, response, reqCorpRegNo);
		
		if  (countCorp != 1) {
			resultMap.put("RES_CD", "001");
			resultMap.put("RES_MSG", "기업정보등록에 실패하였습니다.");
		} else if (corp_reg_no == null) {
			resultMap.put("RES_CD", "002");
			resultMap.put("RES_MSG", "기업정보등록에 실패하였습니다.");
		} else {
			resultMap.put("RES_CD", "000");
			resultMap.put("RES_MSG", "기업정보등록에 성공하였습니다.");
			resultMap.put("CORP_NO", corp_reg_no.get("CORP_NO"));
		}
		
		return resultMap;
	}
	
	// 기업 고유번호 조회
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="getCorpNo")
	public HashMap<String, Object> getCorpNo(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("CORP_NO", regCorpServiceI.getCorpNo(param).get("CORP_NO"));
		
		return resultMap;
	}
	
	// 관리자 정보 삽입
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="regAdmin")
	public HashMap<String, Object> regAdmin(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int countAdmin = regCorpServiceI.insertRegAdmin(param);
		
		if  (countAdmin != 1) {
			resultMap.put("RES_CD", "003");
			resultMap.put("RES_MSG", "관리자 정보 등록에 실패하였습니다.");
		} else {
			resultMap.put("RES_CD", "000");
			resultMap.put("RES_MSG", "기업정보등록에 성공하였습니다.");
		}
		
		return resultMap;
	}
	
}