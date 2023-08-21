package com.forTicket.theater.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.theater.service.TheaterService;
import com.forTicket.theater.vo.TheaterVO;

@Controller("theaterController")
public class TheaterControllerImpl implements TheaterController {
	private static String THEATER_IMAGE_REPO = "C:\\forTicket\\theater";
	@Autowired
	private TheaterService theaterService;

	// 공연장 목록
	@Override
	@RequestMapping(value = "/theater/listTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listTheater(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String) req.getAttribute("viewName");
		List theatersList = theaterService.listTheaters();
		ModelAndView mav = new ModelAndView();
		mav.addObject("theatersList", theatersList);
		mav.setViewName(viewName);
		return mav;
	}

	// 공연장 상세정보
	@Override
	@RequestMapping(value = "/theater/detailTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView detailTheater(@RequestParam("theater_id") int theater_id, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("html/text;charset=utf-8");
		String viewName = (String) req.getAttribute("viewName");
		TheaterVO theaterVO = theaterService.theaterInfo(theater_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("theater", theaterVO);
		return mav;
	}

	// 공연장 등록
	@Override
	@RequestMapping(value = "/theater/addTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity addTheater(MultipartHttpServletRequest multipartReq, HttpServletResponse resp) throws Exception {
		multipartReq.setCharacterEncoding("utf-8");
		Map<String, Object> theaterMap = new HashMap<String, Object>();
		Enumeration enu = multipartReq.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartReq.getParameter(name);
			theaterMap.put(name, value);
		}
		String theater_image = upload(multipartReq);
		theaterMap.put("theater_image", theater_image);
		System.out.println(theaterMap);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			int theater_id = theaterService.addTheater(theaterMap);
			if(theater_image!=null&&theater_image.length()!=0) {
				File srcFile = new File(THEATER_IMAGE_REPO+"\\"+"temp"+"\\"+theater_image);
				File destDir = new File(THEATER_IMAGE_REPO+"\\"+theater_id);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += " alert('공연장이 등록되었습니다.');";
			message += "location.href='"+multipartReq.getContextPath()+"/theater/detailTheater.do?theater_id="+theater_id+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(THEATER_IMAGE_REPO+"\\"+"temp"+"\\"+theater_image);
			srcFile.delete();
			message = "<script>";
			message += " alert('공연장 등록에 실패했습니다.');";
			message += "location.href='"+multipartReq.getContextPath()+"/theater/theaterForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 공연장 삭제
	@Override
	@RequestMapping(value = "/theater/removeTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity removeTheater(@RequestParam("theater_id") int theater_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			theaterService.removeTheater(theater_id);
			File destDir = new File(THEATER_IMAGE_REPO+"\\"+theater_id);
			FileUtils.deleteDirectory(destDir);
			message = "<script>";
			message += " alert('공연장이 삭제되었습니다.');";
			message += "location.href='"+req.getContextPath()+"/theater/listTheater.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('공연장 삭제에 실패했습니다.');";
			message += "location.href='"+req.getContextPath()+"/theater/detailTheater.do?theater_id="+theater_id+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 공연장 수정 페이지
	@Override
	@RequestMapping(value = "/theater/modTheaterForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modForm(@RequestParam("theater_id") int theater_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		System.out.println("viewName: "+viewName);
		TheaterVO theaterVO = theaterService.theaterInfo(theater_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("theater", theaterVO);
		return mav;
	}

	// 공연장 수정
	@Override
	@RequestMapping(value = "/theater/modTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity modTheater(MultipartHttpServletRequest multipartReq, HttpServletResponse resp)
			throws Exception {
		multipartReq.setCharacterEncoding("utf-8");
		Map<String, Object> theaterMap = new HashMap<String, Object>();
		Enumeration enu = multipartReq.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartReq.getParameter(name);
			theaterMap.put(name, value);
		}
		
		String theater_image = upload(multipartReq);
		theaterMap.put("theater_image", theater_image);
		int theater_id = Integer.parseInt((String)theaterMap.get("theater_id"));
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			theaterService.modTheater(theaterMap);
			if(theater_image!=null&&theater_image.length()!=0) {
				String originalFileName = (String)theaterMap.get("originalFileName");
				File oldFile = new File(THEATER_IMAGE_REPO+"\\"+"temp"+"\\"+originalFileName);
				oldFile.delete();
				
				File srcFile = new File(THEATER_IMAGE_REPO+"\\"+"temp"+"\\"+theater_image);
				File destDir = new File(THEATER_IMAGE_REPO+"\\"+theater_id);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += " alert('공연장이 수정되었습니다.');";
			message += "location.href='"+multipartReq.getContextPath()+"/theater/detailTheater.do?theater_id="+theater_id+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(THEATER_IMAGE_REPO+"\\"+"temp"+"\\"+theater_image);
			srcFile.delete();
			message = "<script>";
			message += " alert('공연장 수정에 실패했습니다.');";
			message += "location.href='"+multipartReq.getContextPath()+"/theater/detailTheater.do?theater_id="+theater_id+"';";
			message += "</script>";
			e.printStackTrace();
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@RequestMapping(value="/theater/*Form.do", method={RequestMethod.GET, RequestMethod.POST})
	private ModelAndView form(@RequestParam(value="result", required=false) String result, @RequestParam(value="action", required=false) String action, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String) req.getAttribute("viewName");
		HttpSession session = req.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	private String getViewName(HttpServletRequest req) throws Exception {
		String contextPath = req.getContextPath();
		String uri = (String) req.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = req.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.indexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

	private String upload(MultipartHttpServletRequest multipartReq) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartReq.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartReq.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(THEATER_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(THEATER_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
				}
			}
		}
		return imageFileName;
	}
}
