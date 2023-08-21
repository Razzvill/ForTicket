package com.forTicket.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.goods.vo.G_imageFileVO;

@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {
	public List selectGoodsList() throws DataAccessException;
	public List selectAdminGoodsList(Map condMap) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException;
	public int selectGoodsNo(Map goodsMap) throws DataAccessException;
	public void insertGoods(Map goodsMap) throws DataAccessException;
	public void updateGoods(Map goodsMap) throws DataAccessException;
	public void deleteGoods(int event_no) throws DataAccessException;
	public List selectGoodsImageFileList(int goods_id) throws DataAccessException;
	public void insertGoodsImageFile(G_imageFileVO imageFileVO) throws DataAccessException;
	public void updateGoodsImage(G_imageFileVO imageFileVO) throws DataAccessException;
	public void deleteGoodsImage(int image_id) throws DataAccessException;
	public void deleteAllGoodsImage(int image_id) throws DataAccessException;
}
