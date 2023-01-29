package com.att.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
//	@RequestMapping(value="/urlTest", method=RequestMethod.GET)
//    public String urlTest() {
//        
//        return "/testView";    // JSP 경로
//    }

	/*
	 * 로그인 화면 이동
	 */
	@RequestMapping(value="/urlTest")
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("/test/testView");
		
		System.out.println("loginManage!");
		
		return mv;
	}
}
