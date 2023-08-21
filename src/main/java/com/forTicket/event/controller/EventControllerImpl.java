package com.forTicket.event.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.forTicket.event.service.EventService;
import com.forTicket.event.vo.EventVO;
import com.forTicket.goods.vo.G_imageFileVO;
import com.forTicket.member.vo.MemberVO;

@Controller("eventController")
public class EventControllerImpl implements EventController {
	private static String EVENT_IMAGE_REPO = "C:\\forTicket\\event";
	@Autowired
	private EventService eventService;
	
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
	
	//이벤트 목록 (관리자)
	@Override
	@RequestMapping(value = "/event/A_listEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView A_listEvent(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		
		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String search_type = dateMap.get("search_type");
		String search_word = dateMap.get("search_word");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		condMap.put("section",section);
		if(pageNum== null) {
			pageNum = "1";
		}
		condMap.put("pageNum",pageNum);
		condMap.put("beginDate",beginDate);
		condMap.put("endDate", endDate);
		condMap.put("search_type",search_type);
		condMap.put("search_word", search_word);
		
		ArrayList eventList = (ArrayList) eventService.A_listEvents(condMap);
		mav.addObject("eventList", eventList);
		
		String beginDate1[]=beginDate.split("-");
		String endDate2[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate2[0]);
		mav.addObject("endMonth",endDate2[1]);
		mav.addObject("endDay",endDate2[2]);
		
		mav.addObject("search_type",search_type);
		mav.addObject("search_word",search_word);
		
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//이벤트 목록 (사업자)
	@Override
	@RequestMapping(value = "/event/B_listEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView B_listEvent(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		
		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String search_type = dateMap.get("search_type");
		String search_word = dateMap.get("search_word");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		
		HashMap<String,Object> condMap=new HashMap<String,Object>();
		if(section== null) {
			section = "1";
		}
		condMap.put("section",section);
		if(pageNum== null) {
			pageNum = "1";
		}
		condMap.put("pageNum",pageNum);
		condMap.put("beginDate",beginDate);
		condMap.put("endDate", endDate);
		condMap.put("search_type",search_type);
		condMap.put("search_word", search_word);
		
		ArrayList eventList = (ArrayList) eventService.A_listEvents(condMap);
		mav.addObject("eventList", eventList);
		
		String beginDate1[]=beginDate.split("-");
		String endDate2[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate2[0]);
		mav.addObject("endMonth",endDate2[1]);
		mav.addObject("endDay",endDate2[2]);
		
		mav.addObject("search_type",search_type);
		mav.addObject("search_word",search_word);
		
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.setViewName(viewName);
		
		return mav;
	}

	//이벤트 상세페이지
	@Override
	public ModelAndView detailEvent(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("html/text;charset=utf-8");
		String viewName = (String) req.getAttribute("viewName");
		Map event = eventService.eventInfo(event_no);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("event", event);
		return mav;
	}

	//이벤트 등록
	@Override
	@RequestMapping(value= "/event/addEvent.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResponseEntity addEvent(MultipartHttpServletRequest multipartReq, HttpServletResponse resp)
			throws Exception {
		multipartReq.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartReq.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartReq.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartReq.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String reg_id = memberVO.getMem_id();
		
		
		List<G_imageFileVO> imageFileList = upload(multipartReq);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(G_imageFileVO imageFileVO : imageFileList) {
				imageFileVO.setReg_id(reg_id);
			}
			goodsMap.put("imageFileList", imageFileList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int goods_id = eventService.addEvent(goodsMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(EVENT_IMAGE_REPO+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('이벤트 등록에 성공했습니다.');";
			message +=" location.href='"+multipartReq.getContextPath()+"/goods/a_listGoods.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(EVENT_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message= "<script>";
			message += " alert('이벤트 등록에 실패했습니다.');";
			message +=" location.href='"+multipartReq.getContextPath()+"/goods/addGoodsForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	//이벤트 삭제
	@Override
	@RequestMapping(value = "/event/removeEvent.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity removeEvent(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String type = memberVO.getType();
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			eventService.removeEvent(event_no);
			eventService.removeAllEventImage(event_no);
			File destDir = new File(EVENT_IMAGE_REPO+"\\"+event_no);
			FileUtils.deleteDirectory(destDir);
			message = "<script>";
			message += " alert('이벤트가 삭제되었습니다.');";
			if(type=="admin") {
				message += "location.href='"+req.getContextPath()+"/event/A_listEvent.do';";
			} else {
				message += "location.href='"+req.getContextPath()+"/event/B_listEvent.do';";
			}
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('이벤트 삭제에 실패했습니다.');";
			if(type=="admin") {
				message += "location.href='"+req.getContextPath()+"/event/A_listEvent.do';";
			} else {
				message += "location.href='"+req.getContextPath()+"/event/B_listEvent.do';";
			}
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	//이벤트 수정 페이지
	@Override
	@RequestMapping(value = "/event/modEventForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modForm(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		Map eventMap = eventService.eventInfo(event_no);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("eventMap", eventMap);
		return mav;
	}

	//이벤트 수정
	@Override
	
	@ResponseBody
	public ResponseEntity modEvent(MultipartHttpServletRequest multipartReq, HttpServletResponse resp)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//이벤트 등록상태 수정
	@Override
	@RequestMapping(value="/event/modEventStatus.do" ,method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
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
	
	@Override
	public ModelAndView addForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addNewGoodsImage(MultipartHttpServletRequest multipartReq, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modGoodsImage(MultipartHttpServletRequest multipartReq, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeGoodsImage(int event_no, int image_id, String imageFileName, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}

	protected String calcSearchPeriod(String fixedSearchPeriod){
		String beginDate=null;
		String endDate=null;
		String endYear=null;
		String endMonth=null;
		String endDay=null;
		String beginYear=null;
		String beginMonth=null;
		String beginDay=null;
		DecimalFormat df = new DecimalFormat("00");
		Calendar cal=Calendar.getInstance();
		
		endYear   = Integer.toString(cal.get(Calendar.YEAR));
		endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
		endDay   = df.format(cal.get(Calendar.DATE));
		endDate = endYear +"-"+ endMonth +"-"+endDay;
		
		if(fixedSearchPeriod == null) {
			cal.add(cal.MONTH,-4);
		}else if(fixedSearchPeriod.equals("one_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -7);
		}else if(fixedSearchPeriod.equals("two_week")) {
			cal.add(Calendar.DAY_OF_YEAR, -14);
		}else if(fixedSearchPeriod.equals("one_month")) {
			cal.add(cal.MONTH,-1);
		}else if(fixedSearchPeriod.equals("two_month")) {
			cal.add(cal.MONTH,-2);
		}else if(fixedSearchPeriod.equals("three_month")) {
			cal.add(cal.MONTH,-3);
		}else if(fixedSearchPeriod.equals("four_month")) {
			cal.add(cal.MONTH,-4);
		}
		
		beginYear   = Integer.toString(cal.get(Calendar.YEAR));
		beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
		beginDay   = df.format(cal.get(Calendar.DATE));
		beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		
		return beginDate+","+endDate;
	}
	protected List<G_imageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<G_imageFileVO> fileList= new ArrayList<G_imageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			G_imageFileVO imageFileVO =new G_imageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			imageFileVO.setFileName(originalFileName);
			fileList.add(imageFileVO);
			
			File file = new File(EVENT_IMAGE_REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //��λ� ������ �������� ���� ���
					if(file.getParentFile().mkdirs()){ //��ο� �ش��ϴ� ���丮���� ����
							file.createNewFile(); //���� ���� ����
					}
				}
				mFile.transferTo(new File(EVENT_IMAGE_REPO +"\\"+"temp"+ "\\"+originalFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
			}
		}
		return fileList;
	}
}
