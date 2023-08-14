package com.forTicket.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("DramaController")
public class GoodsControllerImpl implements GoodsController{
	
	//연극 리스트
	@RequestMapping(value= "/goods/listDrama.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//상품 상세페이지
	@RequestMapping(value={"/goods/detailGoods.do"}, method={RequestMethod.GET, RequestMethod.POST})
	private ModelAndView goodsDetail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
