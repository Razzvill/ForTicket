package com.forTicket.schedule.controller;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.goods.service.GoodsService;
import com.forTicket.member.vo.MemberVO;
import com.forTicket.schedule.service.ScheduleService;
import com.forTicket.schedule.vo.ScheduleVO;
import com.forTicket.theater.service.TheaterService;

@Controller("scheduleController")
public class ScheduleControllerImpl implements ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private GoodsService goodsService;

	
	@Override
	@RequestMapping(value={"/schedule/listSchedule.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listSchedule(HttpServletRequest req, HttpServletResponse response) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String type = (String)session.getAttribute("type");
		ArrayList<ScheduleVO> scheduleList = null;
		if(type.equals("B")) {
			String mem_id = memberVO.getMem_id();
			scheduleList = scheduleService.listSchedule(mem_id);
			for(int i=0; i<scheduleList.size(); i++) {
				ScheduleVO schedule = scheduleList.get(i);
				String s_dateTime = schedule.getS_dateTime();
				String[] dateAndTime = s_dateTime.split(" ");
	            if (dateAndTime.length == 2) {
	                String s_date = dateAndTime[0];
	                String s_time = dateAndTime[1];
	                schedule.setS_date(s_date);
	                schedule.setS_time(s_time);
	            }
			}
		} else {
			scheduleList = scheduleService.listAdmin();
			for(int i=0; i<scheduleList.size(); i++) {
				ScheduleVO schedule = scheduleList.get(i);
				String s_dateTime = schedule.getS_dateTime();
				String[] dateAndTime = s_dateTime.split(" ");
	            if (dateAndTime.length == 2) {
	                String s_date = dateAndTime[0];
	                String s_time = dateAndTime[1];
	                schedule.setS_date(s_date);
	                schedule.setS_time(s_time);
	            }
			}
		}
		mav.addObject("member", memberVO);
		mav.addObject("scheduleList", scheduleList);
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/schedule/addScheduleForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addScheduleForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List goodsList = goodsService.listGoods();
		List theaterList = theaterService.listTheaters();
		mav.addObject("goodsList", goodsList);
		mav.addObject("theaterList", theaterList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/schedule/addSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addSchedule(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		Map scMap = new HashMap();
		Enumeration enu=req.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=req.getParameter(name);
			scMap.put(name,value);
		}
		String s_dates = (String)scMap.get("s_date");
		String s_time = (String)scMap.get("s_time");
		String s_date = s_dates+" "+s_time;
		System.out.println(s_date);
		scMap.remove("s_time");
		scMap.remove("s_date");
		scMap.put("s_date", s_date);
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		scMap.put("reg_id", reg_id);
		
		System.out.println(reg_id+" /schedule/addScheduleForm.do/schedule/addScheduleForm.do");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			scheduleService.addSchedule(scMap);
			message= "<script>";
			message += " alert('스케줄 등록에 성공했습니다.');";
			message +=" location.href='"+req.getContextPath()+"/schedule/listSchedule.do';";
			message +=("</script>");
		}catch(Exception e) {
			message= "<script>";
			message += " alert('스케줄 등록에 실패했습니다.');";
			message +=" location.href='"+req.getContextPath()+"/schedule/addScheduleForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	

	@Override
	@RequestMapping(value = "/schedule/removeSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity removeSchedule(@RequestParam("s_no") int s_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			scheduleService.removeSchedule(s_no);
			message = "<script>";
			message += " alert('스케줄이 삭제되었습니다.');";
			message += "location.href='"+req.getContextPath()+"/schedule/listSchedule.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('스케줄 삭제에 실패했습니다.');";
			message += "location.href='"+req.getContextPath()+"/schedule/listSchedule.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/schedule/getSelectedSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception {
		Map condMap = new HashMap();
		condMap.put("theater_id", theater_id);
		condMap.put("s_date", s_date);
		String selectThAndDate = scheduleService.getSelectedSchedule(condMap);
		System.out.println(selectThAndDate);
		return selectThAndDate;
	}
	
}
