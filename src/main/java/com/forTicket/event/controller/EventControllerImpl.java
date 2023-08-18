package com.forTicket.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.event.service.EventService;
import com.forTicket.event.vo.EventVO;

@Controller("eventController")
public class EventControllerImpl implements EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventVO eventVO;
	
	//이벤트 목록
	@Override
	@RequestMapping(value = "/event/listEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listEvent(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String) req.getAttribute("viewName");
		HttpSession session=req.getSession();
		List eventList = eventService.listEvents();
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventList", eventList);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	public ModelAndView detailEvent(@RequestParam("event_no") int event_no, @RequestParam("image_id") int image_id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("html/text;charset=utf-8");
		String viewName = (String) req.getAttribute("viewName");
		Map event = eventService.eventInfo(event_no, image_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("event", event);
		return mav;
	}

	@Override
	public ResponseEntity addEvent(MultipartHttpServletRequest multipartReq, HttpServletResponse resp)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity removeEvent(int id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView modForm(int id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResponseEntity modEvent(MultipartHttpServletRequest multipartReq, HttpServletResponse resp)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	@RequestMapping(value="/event/modEventStatus.do" ,method={RequestMethod.POST})
	public ResponseEntity modEventStatus(@RequestParam("event_no") int event_no,
			                     @RequestParam("attribute") String attribute,
			                     @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		//System.out.println("modifyGoodsInfo");
		
		Map goodsMap=new HashMap();
		goodsMap.put("event_no", event_no);
		goodsMap.put(attribute, value);
		eventService.modEventStatus(goodsMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
}
