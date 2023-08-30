package com.forTicket.order.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.member.vo.MemberVO;
import com.forTicket.order.service.OrderService;
import com.forTicket.order.vo.OrderVO;
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
	
	@Autowired
	private OrderVO orderVO;
	
	@Autowired
	private OrderService orderService;
	
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
		
		System.out.println("order_seatNone - goodsMap: "+goodsMap);
		System.out.println("order_seatNone - theaterVO: "+theaterVO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("theater", theaterVO);
		return mav;
	}
	
	//결제화면
	@Override
	@RequestMapping(value= "/order/ticketReservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ticketReservation(@ModelAttribute("orderVO") OrderVO _orderVO,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		session=request.getSession();
		
		Boolean isLogOn=(Boolean)session.getAttribute("isLogOn");
		String action=(String)session.getAttribute("action");
		//로그인 여부 체크
		//이전에 로그인 상태인 경우는 주문과정 진행
		//로그아웃 상태인 경우 로그인 화면으로 이동
		if(isLogOn==null || isLogOn==false){
			session.setAttribute("orderInfo", _orderVO);
			session.setAttribute("action", "/order/ticketReservation.do");
			return new ModelAndView("redirect:/member/loginForm.do");
		}else{
			 if(action!=null && action.equals("/order/ticketReservation.do")){
				orderVO=(OrderVO)session.getAttribute("orderInfo");
				session.removeAttribute("action");
			 }else {
				 orderVO=_orderVO;
			 }
		 }
				
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List myOrderList=new ArrayList<OrderVO>();
		myOrderList.add(orderVO);
		
		MemberVO memberInfo=(MemberVO)session.getAttribute("member");
		
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberInfo);
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
