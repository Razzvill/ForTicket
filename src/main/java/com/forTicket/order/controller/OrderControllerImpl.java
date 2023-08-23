package com.forTicket.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.common.util.ValidUtil;
import com.forTicket.goods.controller.GoodsController;
import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.G_imageFileVO;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.theater.dao.TheaterDAO;
import com.forTicket.theater.service.TheaterService;
import com.forTicket.theater.vo.TheaterVO;


@Controller("OrderController")
public class OrderControllerImpl {
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private TheaterDAO theaterDAO;

	//예매 페이지-좌석선택(날짜선택 등)
	@RequestMapping(value={"/order/order_seat.do"}, method={RequestMethod.GET, RequestMethod.POST})
	private ModelAndView order_seat(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	

	//예매 페이지-좌석 미선택(날짜선택 등)
		@RequestMapping(value={"/order/order_seatNone.do"}, method={RequestMethod.GET, RequestMethod.POST})
		private ModelAndView order_seatNone(@RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
			String viewName = (String)req.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			
			G_imageFileVO imageObj = null;
			GoodsVO goodsObj = null;
			
			// 연극 정보 조회
			Map goodsMap = goodsService.goodsInfo(goods_id);
			
			// 이미지
			if(!ValidUtil.isMapEmpty(goodsMap, "goodsImage")) {
				imageObj = (G_imageFileVO) goodsMap.get("goodsImage");
			}
			
			// 연극 상세 설정
			if(!ValidUtil.isMapEmpty(goodsMap, "goods")) {
				goodsObj = (GoodsVO) goodsMap.get("goods");
				
				int theater_id = (Integer)theaterDAO.selectIdFromName(goodsObj.getGoods_place());
				TheaterVO theaterVO = theaterService.theaterInfo(theater_id);
				mav.addObject("theater", theaterVO);
			}
			

			mav.addObject("goods", goodsObj);
			mav.setViewName(viewName);
			return mav;
		}
	
	//결제화면
	@RequestMapping(value= "/order/ticketReservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView ticketReservation(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//예약완료
	@RequestMapping(value= "/order/reservationSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView reservationSuccess(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//예매상세
	@RequestMapping(value= "/order/ticketDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView ticketDetail(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//환불 신청 화면
	@RequestMapping(value= "/order/ticketrefund.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView ticketrefund(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//환불 완료 페이지
		@RequestMapping(value= "/order/refundSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
		private ModelAndView refundSuccess(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			
			HttpSession session=request.getSession();
					
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			
			return mav;
		}
	
}
