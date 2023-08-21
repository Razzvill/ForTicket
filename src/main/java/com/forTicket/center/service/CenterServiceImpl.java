package com.forTicket.center.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.center.dao.CenterDAO;
import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;

@Service("centerService")
@Transactional(propagation = Propagation.REQUIRED)
public class CenterServiceImpl implements CenterService{
	@Autowired
	private CenterDAO centerDAO;
	
	@Autowired
	private QuestionVO questionDAO;
		
	//글 저장
	@Override
	public int addWrite(CenterVO centerVO) throws DataAccessException {
		return centerDAO.addWrite(centerVO);
	}
		
	//고객센터 상세화면
	@Override
	public CenterVO view(int center_No) throws Exception {
		CenterVO center = centerDAO.view(center_No);
		return center;
	}
	
	//고객센터 상세 수정하기 
	@Override
	public void edit(Map vieswMap) throws DataAccessException {
		centerDAO.edit(vieswMap);
	}
	
	//고객센터 상세 삭제하기 
	@Override
	public void delete(int center_No) throws Exception {
		centerDAO.delete(center_No);
	}
	
	//고객센터 목록
	@Override
	public ArrayList<CenterVO> list(HashMap condMap) throws Exception{
		ArrayList<CenterVO> refund_list = centerDAO.list(condMap);
		return refund_list;
	}

	//1:1이동시 id가져오기
	@Override
	public List<QuestionVO> questionList(String mem_id) throws DataAccessException {
		return centerDAO.questionList(mem_id);
	}

	//1:1 글 추가
	@Override
	public int addQue(QuestionVO questionVO) throws DataAccessException {
		return centerDAO.addQue(questionVO);
	}
	
}
