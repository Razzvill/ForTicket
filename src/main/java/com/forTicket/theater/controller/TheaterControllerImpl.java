package com.forTicket.theater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("theaterController")
public class TheaterControllerImpl {
	@RequestMapping(value="/theater/listTheater.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listTheater(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/theater/detailTheater.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView detailTheater(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		String t_name = req.getParameter("t_name");
		ModelAndView mav = new ModelAndView();
		mav.addObject("t_name", t_name);
		mav.setViewName(viewName);
		return mav;
	}

	private String getViewName(HttpServletRequest req) throws Exception {
		String contextPath = req.getContextPath();
		String uri = (String) req.getAttribute("javax.servlet.include.request_uri");
		if(uri==null||uri.trim().equals("")) {
			uri = req.getRequestURI();
		}
		
		int begin = 0;
		if(!((contextPath==null)||("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		
		int end;
		if(uri.indexOf(";")!=-1) {
			end = uri.indexOf(";");
		} else if(uri.indexOf("?")!=-1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String viewName = uri.substring(begin, end);
		if(viewName.indexOf(".")!=-1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if(viewName.indexOf("/")!=-1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}
}
