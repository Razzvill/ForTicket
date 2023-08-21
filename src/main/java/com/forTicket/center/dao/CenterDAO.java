package com.forTicket.center.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;

@Mapper
@Repository("centerDAO")
public interface CenterDAO {
	//글 저장
	public int addWrite(CenterVO centerVO) throws DataAccessException;
	
	//고객센터 글 상세창
	public  CenterVO view(int center_No) throws DataAccessException;
	
	//고객센터 상세 수정하기
	public void edit(Map vieswMap) throws DataAccessException;
	
	//고객센터 상세 삭제하기
	public void delete(int center_No) throws Exception; 
	
	//고객센터 환불안내
	public ModelAndView refund(HttpServletRequest req,HttpServletResponse resp) throws Exception;
	
	//고객센터 작성 목록
	public ArrayList<CenterVO> list(HashMap condMap) throws DataAccessException;

	//고객센터 1:1시 id가져오기
	public List quelist(QuestionVO questionVO)  throws DataAccessException;
	
	//1:1 글 저장
	public int addQue(QuestionVO questionVO) throws DataAccessException;
	
}