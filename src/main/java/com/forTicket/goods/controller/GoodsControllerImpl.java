package com.forTicket.goods.controller;

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

import com.forTicket.common.util.ValidUtil;
import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.G_imageFileVO;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.member.vo.MemberVO;
import com.forTicket.theater.dao.TheaterDAO;
import com.forTicket.theater.service.TheaterService;
import com.forTicket.theater.vo.TheaterVO;

@Controller("goodsController")
public class GoodsControllerImpl implements GoodsController{
	private static final String GOODS_IMAGE_REPO = "C:\\forTicket\\goods";
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private TheaterDAO theaterDAO;
	
	//상품 목록(사용자)
	@Override
	@RequestMapping(value= "/goods/listGoods.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listGoods(@RequestParam("goodsType") String goodsType, HttpServletRequest req, HttpServletResponse response) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> goodsList = goodsService.listGoods();
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		mav.addObject("member", member);
		mav.addObject("goodsList", goodsList);
		mav.addObject("goodsType", goodsType);
		mav.setViewName(viewName);
		return mav;
	}

	//상품 목록(사업자, 관리자)
	@Override
	@RequestMapping(value= "/goods/a_listGoods.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView a_listGoods(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse response) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		mav.addObject("member", member);
		
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
		
		ArrayList goodsList = (ArrayList) goodsService.a_listGoods(condMap);
		mav.addObject("goodsList", goodsList);
		
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

	//상품 상세페이지
	@Override
	@RequestMapping(value={"/goods/detailGoods.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView detailGoods(@RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName=(String)req.getAttribute("viewName");
		HttpSession session=req.getSession();
		Map goodsMap=goodsService.goodsInfo(goods_id);
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");
		String theater_name = goodsVO.getGoods_place();
		int theater_id = theaterDAO.selectIdFromName(theater_name);
		TheaterVO theaterVO = theaterDAO.selectTheaterInfo(theater_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("theater", theaterVO);
		return mav;
	}
	
	//상품 등록
	@Override
	@RequestMapping(value= "/goods/addGoods.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResponseEntity addGoods(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		goodsMap.put("mem_id", reg_id);
		
		List<G_imageFileVO> imageFileList = upload(multipartRequest);
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
			int goods_id = goodsService.addGoods(goodsMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					
					File srcFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(GOODS_IMAGE_REPO+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('상품 등록에 성공했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/goods/a_listGoods.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			message= "<script>";
			message += " alert('상품 등록에 실패했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/goods/addGoodsForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//상품 등록 페이지
	@Override
	@RequestMapping(value = "/goods/addGoodsForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addForm(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		List<TheaterVO> theaterList = theaterService.listTheaters();
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		mav.addObject("member", member);
		mav.addObject("theaterList", theaterList);
		return mav;
	}

	//상품 수정
	@Override
	@RequestMapping(value= "/goods/modGoods.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResponseEntity modGoods(@RequestParam("goods_id") int goods_id, @RequestParam("attribute") String attribute,
            @RequestParam("value") String value,MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		Map goodsMap=new HashMap();
		goodsMap.put("goods_id", goods_id);
		goodsMap.put(attribute, value);
		goodsService.modGoods(goodsMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//상품 수정 페이지
	@Override
	@RequestMapping(value = "/goods/modGoodsForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modForm(@RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		String viewName = (String)req.getAttribute("viewName");
		Map goodsMap = goodsService.goodsInfo(goods_id);
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		List<TheaterVO> theaterList = theaterService.listTheaters();
		mav.addObject("theaterList", theaterList);
		mav.addObject("member", member);
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	//상품 삭제
	@Override
	@RequestMapping(value = "/goods/removeGoods.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity removeGoods(@RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			goodsService.removeGoods(goods_id);
			goodsService.removeAllGoodsImage(goods_id);
			File destDir = new File(GOODS_IMAGE_REPO+"\\"+goods_id);
			FileUtils.deleteDirectory(destDir);
			message = "<script>";
			message += " alert('상품이 삭제되었습니다.');";
			message += "location.href='"+req.getContextPath()+"/goods/listGoods.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('상품 삭제에 실패했습니다.');";
			message += "location.href='"+req.getContextPath()+"/goods/detailGoods.do?goods_id="+goods_id+"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	

	//상품 이미지 추가
	@Override
	@RequestMapping(value="/addGoodsImage.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public void addNewGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		
		List<G_imageFileVO> imageFileList=null;
		int goods_id=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(G_imageFileVO imageFileVO : imageFileList) {
					goods_id = Integer.parseInt((String)goodsMap.get("goods_id"));
					imageFileVO.setGoods_id(goods_id);
					imageFileVO.setReg_id(reg_id);
				}
				
			    goodsService.addGoodsImage(imageFileList);
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(GOODS_IMAGE_REPO+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
		
	}

	//상품 이미지 수정
	@Override
	@RequestMapping(value="/modGoodsImage.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public void modGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMem_id();
		
		List<G_imageFileVO> imageFileList=null;
		int goods_id=0;
		int image_id=0;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(G_imageFileVO imageFileVO : imageFileList) {
					goods_id = Integer.parseInt((String)goodsMap.get("goods_id"));
					image_id = Integer.parseInt((String)goodsMap.get("image_id"));
					String originalFileName = (String)goodsMap.get("originalFileName");
					File oldFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+originalFileName);
					oldFile.delete();
					imageFileVO.setGoods_id(goods_id);
					imageFileVO.setImage_id(image_id);
					imageFileVO.setReg_id(reg_id);
				}
				
			    goodsService.modGoodsImage(imageFileList);
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					File destDir = new File(GOODS_IMAGE_REPO+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(G_imageFileVO  imageFileVO:imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}
		
	}

	//상품 이미지 삭제
	@Override
	@RequestMapping(value="/removeGoodsImage.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public void removeGoodsImage(@RequestParam("goods_id") int goods_id, @RequestParam("image_id") int image_id, @RequestParam("imageFileName") String imageFileName, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
		goodsService.removeGoodsImage(image_id);
		try{
			File srcFile = new File(GOODS_IMAGE_REPO+"\\"+goods_id+"\\"+imageFileName);
			srcFile.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/goods/*Form.do", method={RequestMethod.GET, RequestMethod.POST})
	private ModelAndView form(@RequestParam(value="result", required=false) String result, @RequestParam(value="action", required=false) String action, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String) req.getAttribute("viewName");
		HttpSession session = req.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		MemberVO member = (MemberVO) session.getAttribute("member");
		mav.addObject("member", member);
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
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
			
			File file = new File(GOODS_IMAGE_REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){
				if(! file.exists()){
					if(file.getParentFile().mkdirs()){
							file.createNewFile();
					}
				}
				mFile.transferTo(new File(GOODS_IMAGE_REPO +"\\"+"temp"+ "\\"+originalFileName));
			}
		}
		return fileList;
	}
}
