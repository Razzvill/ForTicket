package com.forTicket.schedule.controller;

import java.io.File;
import java.sql.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.G_imageFileVO;
import com.forTicket.schedule.service.ScheduleService;
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
	@RequestMapping(value = "/schedule/getSelectedSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception {
		Map condMap = new HashMap();
		condMap.put("theater_id", theater_id);
		condMap.put("s_date", s_date);
		String selectThAndDate = scheduleService.getSelectedSchedule(condMap);
		return selectThAndDate;
	}
	
}
