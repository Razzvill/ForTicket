package com.forTicket.center.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;

public interface CenterService {
	//글 저장
	public int addWrite(CenterVO centerVO) throws DataAccessException;
	
	//고객센터 상세화면
	public CenterVO view(int center_No) throws Exception;
	
	//고객센터 상세 수정하기 
	public void edit(Map vieswMap) throws DataAccessException;
	
	//고객센터 상세 삭제하기 
	public void delete(int center_No) throws Exception;
	
	//고객센터 목록
	public ArrayList<CenterVO> list(HashMap condMap) throws Exception;
	
	//고객센터 1:1시 id가져오기
//	public QuestionVO question(HashMap condMap) throws DataAccessException;
	
	//글 저장
	public int addQue(QuestionVO questionVO) throws DataAccessException;
}
