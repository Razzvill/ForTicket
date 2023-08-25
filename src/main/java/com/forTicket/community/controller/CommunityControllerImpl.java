package com.forTicket.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.center.vo.QuestionVO;
import com.forTicket.community.service.CommunityService;
import com.forTicket.community.vo.CommunityVO;

@Controller("communityController")
public class CommunityControllerImpl implements CommunityController{
	@Autowired
	private CommunityService communutyService;
	
	@Autowired
	private CommunityVO communityVO;
	
	//관리자 커뮤페이지 이동
	@Override
	@RequestMapping(value="/community/a_Commu.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView a_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}

		condMap.put("pageNum", pageNum);

		ArrayList<CommunityVO> a_commulist = communutyService.a_commulist(condMap);

		mav.addObject("a_commulist", a_commulist);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}
	
	
	//사업자 커뮤페이지 이동
	@Override
	@RequestMapping(value="/community/b_Commu.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView b_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}

		condMap.put("pageNum", pageNum);

		ArrayList<CommunityVO> b_commulist = communutyService.b_commulist(condMap);

		mav.addObject("b_commulist", b_commulist);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}
	
	//회원 커뮤페이지 이동
	@Override
	@RequestMapping(value="/community/u_Commu.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView u_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}

		condMap.put("pageNum", pageNum);

		ArrayList<CommunityVO> u_commulist = communutyService.u_commulist(condMap);

		mav.addObject("u_commulist", u_commulist);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}

	//리뷰추가
	@RequestMapping(value="/community/add_review.do", method={RequestMethod.GET,RequestMethod.POST})
	public ResponseEntity addQue(@ModelAttribute("community") CommunityVO communityVO , HttpServletRequest request, HttpServletResponse response) throws Exception{

		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			int result = communutyService.add_review(communityVO);

			message = "<script>";
			message += " alert('글을 작성했습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/u_Commu.do';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/u_Commu.do';";
			message += "</script>";

			e.printStackTrace();
		}

		return resEnt;
	}
	
	
	
}
