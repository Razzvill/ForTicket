package com.forTicket.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.goods.vo.ImageFileVO;

public interface GoodsService {
	public List listGoods() throws DataAccessException;
	public List a_listGoods(Map condMap) throws DataAccessException;
	public Map goodsInfo(int goods_id) throws DataAccessException;
	public int addGoods(Map goodsMap) throws DataAccessException;
	public void modGoods(Map goodsMap) throws DataAccessException;
	public void removeGoods(int goods_id) throws DataAccessException;
	public void addGoodsImage(List imageFileList) throws DataAccessException;
	public void modGoodsImage(List imageFileList) throws DataAccessException;
	public void removeGoodsImage(int image_id) throws DataAccessException;
	public void removeAllGoodsImage(int goods_id) throws DataAccessException;
}
