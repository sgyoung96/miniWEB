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
import com.att.service.AdminPageServiceI;

@Controller
@RequestMapping(value="admin")
public class AdminPageController {

	@Autowired
	AdminPageServiceI adminPageServiceI;
	
	// 화면 이동
	@RequestMapping(value="adminPage")
	public ModelAndView goAdminPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main/adminPage");
		
		System.out.println("main > My Page!");
		
		return mv;
	}
	
	// 권한별 승인 대기 상태 목록 뿌리기
	@ResponseBody
	@RequestMapping(value="getAllUserByCorp")
	public HashMap<String, Object> getAllUserByCorp(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> loginInfo = (HashMap<String, Object>) request.getSession().getAttribute("loginInfo");
		String authCd = loginInfo.get("AUTH_CD").toString();
		param.put("CORP_NO", loginInfo.get("CORP_NO"));
		
		if (!authCd.equals("B02")) {
			resultMap.put("RES_CD", "001");
			resultMap.put("RES_MSG", "해당 페이지에 관한 접근 권한이 없습니다.");
			
			return resultMap;
		} else { // 기업 최고관리자만 리스트 조회 가능 -> 부서장 승급
			List<Object> resHttp = adminPageServiceI.getAllUserByCorp(param);
			
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
	
	@ResponseBody
	@RequestMapping(value="updateUserAuthType")
	public HashMap<String, Object> updateUserAcptType(HttpServletRequest request, HttpServletResponse response, @RequestBody HashMap<String, Object> param) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int count = adminPageServiceI.updateUserAuthType(param);
		if (count > 0) {
			resultMap.put("RES_CD", "000");
			resultMap.put("RES_MSG", "권한 상승 반영이 완료되었습니다.");
		} else {
			resultMap.put("RES_CD", "444");
			resultMap.put("RES_MSG", "권한 상승에 실패하였습니다.");
		}
		
		return resultMap;
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