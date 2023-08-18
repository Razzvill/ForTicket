package com.forTicket.common.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("mainController")
public class MainController {
	 
	@RequestMapping(value={"/main.do"}, method={RequestMethod.GET,RequestMethod.POST})
	 private ModelAndView main(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		
		HttpSession session=req.getSession();
		session=req.getSession();
		
		String viewName = (String)req.getAttribute("viewName");
		 
		ModelAndView mav = new ModelAndView();
		 
		mav.setViewName(viewName);
		 
		return mav;
	}
     

     //검색 결과 창
<<<<<<< HEAD
     @RequestMapping(value={"/mainSearch.do"}, method={RequestMethod.GET,
		 RequestMethod.POST}) private ModelAndView mainsearch(HttpServletRequest req,
		 HttpServletResponse resp) throws Exception { String viewName =
		 (String)req.getAttribute("viewName"); ModelAndView mav = new ModelAndView();
		 mav.setViewName(viewName); return mav; }
=======
     @RequestMapping(value={"/mainsearch.do"}, method={RequestMethod.GET,RequestMethod.POST})
     private ModelAndView mainsearch(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	 String viewName = (String)req.getAttribute("viewName");
    	 
    	 ModelAndView mav = new ModelAndView();
		
    	 mav.setViewName(viewName);
    	 
    	 return mav; }
>>>>>>> refs/remotes/origin/yeji
	     }