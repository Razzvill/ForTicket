package com.forTicket.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.goods.dao.GoodsDAO;
import com.forTicket.goods.vo.G_imageFileVO;
import com.forTicket.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	@Override
	public List listGoods() throws DataAccessException {
		List goodsList = goodsDAO.selectGoodsList();
		return goodsList;
	}

	@Override
	public List a_listGoods(Map condMap) throws DataAccessException {
		List goodsList = goodsDAO.selectAdminGoodsList(condMap);
		return goodsList;
	}

	@Override
	public List findGoodsById(String mem_id) throws DataAccessException {
		List goodsList = goodsDAO.selectGoodsById(mem_id);
		return goodsList;
	}

	@Override
	public Map goodsInfo(int goods_id) throws DataAccessException {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(goods_id);
		List imageFileList = goodsDAO.selectGoodsImageFileList(goods_id);
		goodsMap.put("goods", goodsVO);
		goodsMap.put("imageFileList", imageFileList);
		return goodsMap;
	}

	@Override
	public int addGoods(Map goodsMap) throws DataAccessException {
		goodsDAO.insertGoods(goodsMap);
		int goods_id = goodsDAO.selectGoodsNo(goodsMap);
		ArrayList<G_imageFileVO> imageFileList = (ArrayList) goodsMap.get("imageFileList");
		for(G_imageFileVO imageFileVO : imageFileList) {
			imageFileVO.setGoods_id(goods_id);
			goodsDAO.insertGoodsImageFile(imageFileVO);
		}
		return goods_id;
	}

	@Override
	public void modGoods(Map goodsMap) throws DataAccessException {
		goodsDAO.updateGoods(goodsMap);
	}

	@Override
	public void removeGoods(int goods_id) throws DataAccessException {
		goodsDAO.deleteGoods(goods_id);
	}

	@Override
	public void addGoodsImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			G_imageFileVO imageFileVO = (G_imageFileVO) imageFileList.get(i);
			goodsDAO.insertGoodsImageFile(imageFileVO);
		}
	}

	@Override
	public void modGoodsImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			G_imageFileVO imageFileVO = (G_imageFileVO) imageFileList.get(i);
			goodsDAO.updateGoodsImage(imageFileVO);
		}
	}

	@Override
	public void removeGoodsImage(int image_id) throws DataAccessException {
		goodsDAO.deleteGoodsImage(image_id);
	}

	@Override
	public void removeAllGoodsImage(int goods_id) throws DataAccessException {
		goodsDAO.deleteAllGoodsImage(goods_id);
	}
	
}
