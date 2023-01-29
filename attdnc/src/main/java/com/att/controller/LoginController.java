package com.att.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.att.service.LoginServiceI;

@Controller
@RequestMapping(value="login")
public class LoginController {

	@Autowired
	LoginServiceI loginServiceI;
	
	/*
	 * 로그인 화면 이동
	 */
	@RequestMapping(value="loginManage")
	public ModelAndView goLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("login/login");
		
		System.out.println("loginManage!");
		
		return mv;
	}
	
	
	/*
	 * 로그인 버튼
	 * [1] 아이디 존재 여부 확인
	 * [2] 패스워드 일치 여부 확인
	 */
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="reqLogin")
	public Object reqLogin(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		// 결과값 화면으로 리턴할 변수
		HashMap<String, Object> resParam = new HashMap<String, Object>();
		
		try {
			// [1] 아이디 존재 여부 확인
			HashMap<String, Object> reqId = new HashMap<String, Object>();
			HashMap<String, Object> resId = new HashMap<String, Object>();
			reqId.put("USER_ID", param.get("USER_ID"));
			resId = loginServiceI.selectUserId(reqId);
			
			HashMap<String, Object> tmpId = (HashMap<String, Object>) resId.get("result");
			int rsResultId = Integer.parseInt(tmpId.get("USER_CNT").toString());
			
			// [2] 패스워드 일치 여부 확인
			HashMap<String, Object> reqPw = new HashMap<String, Object>();
			HashMap<String, Object> resPw = new HashMap<String, Object>();
			reqPw.put("USER_ID", param.get("USER_ID"));
			reqPw.put("USER_PW", param.get("USER_PW"));
			resPw = loginServiceI.isMatchUserPw(reqPw);
			
			HashMap<String, Object> tmpPw = (HashMap<String, Object>) resPw.get("result");
			int rsResultPw = Integer.parseInt(tmpPw.get("USER_CNT").toString());
			
			if (rsResultId != 1) { // 일치하는 아이디 정보가 없으면
				resParam.put("RES_CD", "001");
				resParam.put("RES_MSG", "회원가입 후 로그인해 주세요.");
				return resParam;
			} else if (rsResultPw != 1) {
				resParam.put("RES_CD", "002");
				resParam.put("RES_MSG", "패스워드를 확인해 주세요.");
				return resParam;
			} else {
				// 로그인 성공시 -> 승인 현황 조회
				HashMap<String, Object> result = new HashMap<String, Object>();
				result = goMain(request, response, reqId);
				
				if (result.get("ACPT_CD").equals("A01")) { // 대기
					resParam.put("RES_CD", "011");
					resParam.put("RES_MSG", "승인 대기 상태입니다.");
					return resParam;
				} else if (result.get("ACPT_CD").equals("A03")) { // 반려
					resParam.put("RES_CD", "012");
					resParam.put("RES_MSG", "승인 요청이 반려되었습니다.");
					return resParam;
				} else { // 승인
					resParam.put("RES_CD", "000");
					resParam.put("RES_MSG", "로그인 성공하였습니다.");
					
					// 세션에 값 저장				
					request.getSession().setAttribute("loginInfo", getUserInfo(request, response, reqId));

					
					return resParam;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resParam.put("RES_CD", "999");
			resParam.put("RES_MSG", "오류");
			return resParam;
		}
	}
	
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="goMain")
	public HashMap<String, Object> goMain(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("ACPT_CD", loginServiceI.selectAcptState(param).get("ACPT_CD"));
		
		return resultMap;
	}
	
	@Transactional(readOnly = true)
	@ResponseBody
	@RequestMapping(value="getUserInfo")
	public HashMap<String, Object> getUserInfo(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		return loginServiceI.getUserInfo(param);
	}
}
