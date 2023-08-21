package com.forTicket.center.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;

public interface CenterService {
	//타입별 글 번호 저장 updateNum
	public int updateNum(CenterVO centerVO) throws DataAccessException;
	
	//글 저장
	public int addWrite(CenterVO centerVO) throws DataAccessException;
	
	//고객센터 상세화면
	public CenterVO view(int center_No) throws Exception;
	
	//고객센터 상세 수정하기 
	public void edit(Map vieswMap) throws DataAccessException;
	
	//고객센터 상세 삭제하기 
	public void delete(int center_No) throws Exception;
	
	//고객센터 목록
	public List<CenterVO> list() throws Exception;
	
	//고객센터 1:1시 id가져오기
	public QuestionVO question(HashMap condMap) throws DataAccessException;
}
