package com.forTicket.member.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.member.service.MemberService;
import com.forTicket.member.vo.MailDTO;
import com.forTicket.member.vo.MemberVO;

@Controller("MemberController")
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
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
		session.removeAttribute("type");

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
	
	
	//일반 회원가입 페이지
	@RequestMapping(value= "/member/memberForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//사업주 회원가입 페이지
		@RequestMapping(value= "/member/businessForm.do", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView businessForm(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			
			HttpSession session=request.getSession();
					
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			
			return mav;
		}
    
	//일반회원가입 정보 주입
	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView insertMember(@ModelAttribute("member") MemberVO member,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8"); 
	    int result = 0;
	    result = memberService.insertMember(member);
	    ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
	    return mav;
	}
	
	//사업주회원가입 정보 주입
	@Override
	@RequestMapping(value="/member/addbusiness.do" ,method = RequestMethod.POST)
	public ModelAndView insertbusiness(@ModelAttribute("member") MemberVO member,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8"); 
	    int result = 0;
	    result = memberService.insertbusiness(member);
	    ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
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
		    session.setAttribute("type", memberVO.getType());
		   		    
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
	
	//중복검사
	@Override
	@RequestMapping(value="/member/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
    @RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
    public ModelAndView findIdForm(HttpServletRequest request, HttpServletResponse response) {
        String viewName = (String) request.getAttribute("viewName");

        HttpSession session = request.getSession();

        ModelAndView mav = new ModelAndView();
        mav.setViewName(viewName);

        return mav;
    }

    // 아이디 찾기 처리 (이름과 핸드폰번호로)
    @Override
    @RequestMapping(value = "/member/findIdResult.do", method = RequestMethod.POST)
    public ModelAndView findIdResult(@RequestParam("mem_name") String mem_name,
            @RequestParam("phone") String phone, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ModelAndView mav = new ModelAndView();
        String foundId = memberService.findId(mem_name, phone);
        boolean idFound = (foundId != null && !foundId.isEmpty());

        mav.addObject("idFound", idFound);
        mav.addObject("foundId", foundId);
        mav.addObject("mem_name", mem_name);
        mav.setViewName("/member/findIdResult"); // 결과를 표시할 JSP 페이지의 경로

        return mav;
    }
    
    // 이메일 보내기
    @Transactional
    @PostMapping("/member/sendEmail.do")
    public String sendEmail(@RequestParam("email") String email) {
        MailDTO dto = memberService.createMailAndChangePassword(email);
        memberService.mailSend(dto);

        return "redirect:/member/loginForm.do"; // 수정된 부분
    }
   
}