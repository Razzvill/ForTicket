package com.forTicket.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.member.service.MemberService;
import com.forTicket.member.vo.MemberVO;

@Controller("MemberController")
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO ;

	//로그인 페이지 이동
	@RequestMapping(value= "/member/loginForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}	
	
	//회원가입 선택
	@RequestMapping(value= "/member/join.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}	
	
	
	//회원가입 페이지
	@RequestMapping(value= "/member/memberForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//마이페이지 예매내역 이동
	@RequestMapping(value= "/member/myPage4.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView mypage4(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");

		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
    
	//회원가입 정보 주입
	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8"); 
	    int result = 0;
	    result = memberService.addMember(member);
	    ModelAndView mav = new ModelAndView("redirect:/main.do");
	    return mav;
	}
	
	//로그인
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("member", memberVO);
	    session.setAttribute("isLogOn", true);
	    //mav.setViewName("redirect:/member/listMembers.do");
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    if(action!= null) {
	       mav.setViewName("redirect:"+action);
	    }else {
	       mav.setViewName("redirect:/main.do");	
	    }

	}else {
	   rAttr.addAttribute("result","loginFailed");
	   mav.setViewName("redirect:/member/loginForm.do");
	}
	return mav;
	}
	
	@Override
	@RequestMapping(value="/member/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	
}