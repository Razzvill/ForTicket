package com.forTicket.center.controller;

import java.util.ArrayList;
import java.util.Enumeration;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.center.service.CenterService;
import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;
import com.forTicket.member.vo.MemberVO;

@Controller("centerController")
public class CenterControllerImpl implements CenterController {
	@Autowired
	private CenterService centerService;

	@Autowired
	private CenterVO centerVO;

	@Autowired
	private QuestionVO questionVO;
	
	@Autowired
	private MemberVO memberVO;

	// 고객센터 작성페이지
	@Override
	@RequestMapping(value = "/center/write.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView write(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String viewName = (String) req.getAttribute("viewName");

		ModelAndView mav = new ModelAndView();

		mav.setViewName(viewName);

		return mav;
	}

	// 작성글 저장
	@Override
	@RequestMapping(value = "/center/addWirte.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addWirte(@ModelAttribute("center") CenterVO center, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			int result = centerService.addWrite(center);

			message = "<script>";
			message += " alert('글을 작성했습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/notice.do';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/notice.do';";
			message += "</script>";

			e.printStackTrace();
		}

		return resEnt;
	}

	// 고객센터 상세창
	@Override
	@RequestMapping(value = "/center/view.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView view(@RequestParam("center_No") int center_No, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		centerVO = centerService.view(center_No);

		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("views", centerVO);

		return mav;
	}

	// 고객센터 상세 수정하기
	@Override
	@RequestMapping(value = "/center/edit.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity edit(@ModelAttribute("center") CenterVO center, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		Map<String, Object> viewsMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			viewsMap.put(name, value);
		}

		String center_No = (String) viewsMap.get("center_No");

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			centerService.edit(viewsMap);

			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/view.do?center_No=" + center_No + "';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/view.do?center_No=" + center_No + "';";
			message += "</script>";

			e.printStackTrace();
		}
		return resEnt;
	}

	// 고객센터 상세 삭제하기 center/delete_view.do
	@Override
	@RequestMapping(value = "/center/delete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity delete(@RequestParam("center_No") int center_No, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");

		String message;

		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			centerService.delete(center_No);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/refund.do?center_No=" + center_No
					+ "';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/refund.do?center_No=" + center_No
					+ "';";
			message += "</script>";

			e.printStackTrace();
		}
		return resEnt;
	}

	// 고객센터 환불페이지
	@Override
	@RequestMapping(value = "/center/refund.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView refund(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

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

		ArrayList<CenterVO> refund_list = centerService.list(condMap);

		mav.addObject("refund_list", refund_list);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}

	// 고객센터 공지사항
	@Override
	@RequestMapping(value = "/center/notice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView notice(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		session = request.getSession();

		session.setAttribute("side_menu", "center");

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

		ArrayList<CenterVO> notice_list = centerService.list(condMap);

		mav.addObject("notice_list", notice_list);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}

	// 고객센터 FAQ
	@Override
	@RequestMapping(value = "/center/faq.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView faq(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

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

		ArrayList<CenterVO> faq_list = centerService.list(condMap);
		mav.addObject("faq_list", faq_list);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}

	//1:1 문의 목록 - member
	@Override
	@RequestMapping(value = "/center/question.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView question(@RequestParam("mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		questionVO.setMem_id(mem_id);
				
		List<QuestionVO> que_List = centerService.questionList(mem_id);
		mav.addObject("que_List", que_List);
		
		return mav;
	}
	
	
	// 고객센터 1:1 글쓰기
	@Override
	@RequestMapping(value = "/center/q_write.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView q_write(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String viewName = (String) req.getAttribute("viewName");

		ModelAndView mav = new ModelAndView();

		mav.setViewName(viewName);

		return mav;
	}

	// 고객센터 1:1 글 추가 /center/addQue.do
	@RequestMapping(value = "/center/addQue.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity addQue(@ModelAttribute("question") QuestionVO question, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			int result = centerService.addQue(question);

			message = "<script>";
			message += " alert('글을 작성했습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/question.do';";
			message += "</script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 생겼습니다.');";
			message += " location.href='" + request.getContextPath() + "/center/question.do';";
			message += "</script>";

			e.printStackTrace();
		}

		return resEnt;
	}

}