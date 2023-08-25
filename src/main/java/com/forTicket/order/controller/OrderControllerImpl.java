package com.forTicket.order.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.schedule.service.ScheduleService;
import com.forTicket.theater.dao.TheaterDAO;
import com.forTicket.theater.service.TheaterService;
import com.forTicket.theater.vo.TheaterVO;


@Controller("OrderController")
public class OrderControllerImpl implements OrderController{
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private TheaterDAO theaterDAO;

	//예매 페이지-좌석선택(날짜선택 등)
	@Override
	@RequestMapping(value={"/order/order_seat.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView order_seat(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session=req.getSession();
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	

	//예매 페이지-좌석 미선택(날짜선택 등)
	@Override
	@RequestMapping(value={"/order/order_seatNone.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView order_seatNone(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session=req.getSession();
		String viewName = (String)req.getAttribute("viewName");
		Map goodsMap = goodsService.goodsInfo(goods_id);
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");
		String theater_name = goodsVO.getGoods_place();
		int theater_id = theaterDAO.selectIdFromName(theater_name);
		TheaterVO theaterVO = theaterDAO.selectTheaterInfo(theater_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("theater", theaterVO);
		return mav;
	}
	
	//결제화면
	@Override
	@RequestMapping(value= "/order/ticketReservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ticketReservation(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//예약완료
	@Override
	@RequestMapping(value= "/order/reservationSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reservationSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//예매상세
	@Override
	@RequestMapping(value= "/order/ticketDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ticketDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//환불 신청 화면
	@Override
	@RequestMapping(value= "/order/ticketrefund.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ticketrefund(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//환불 완료 페이지
	@Override
	@RequestMapping(value= "/order/refundSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView refundSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/order/getSelectedSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception {
		Map condMap = new HashMap();
		condMap.put("theater_id", theater_id);
		condMap.put("s_date", s_date);
		System.out.println(s_date);
		String selectThAndDate = scheduleService.getSelectedSchedule_order(condMap);
		System.out.println(selectThAndDate);
		return selectThAndDate;
	}
}
