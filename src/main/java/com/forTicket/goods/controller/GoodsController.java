package com.forTicket.goods.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {
	public ModelAndView listGoods(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView a_listGoods(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView detailGoods(@RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity addGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public ModelAndView addForm(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity modGoods(@RequestParam("goods_id") int goods_id, @RequestParam("mod_type") String mod_type, @RequestParam("value") String value, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public ModelAndView modForm(@RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity removeGoods(@RequestParam("theater_id") int theater_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public void addNewGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public void modGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public void removeGoodsImage(@RequestParam("goods_id") int goods_id, @RequestParam("image_id") int image_id, @RequestParam("imageFileName") String imageFileName, HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
