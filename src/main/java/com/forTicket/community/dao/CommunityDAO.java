package com.forTicket.community.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.community.vo.CommunityVO;

@Mapper
@Repository("communityDAO")
public interface CommunityDAO {

	//관리자 커뮤니티 페이지
	public ArrayList<CommunityVO> a_commulist(HashMap condMap) throws DataAccessException;
	
	//사업자 커뮤니티 페이지
	public ArrayList<CommunityVO> b_commulist(HashMap condMap) throws DataAccessException;
	
	//회원 커뮤니티 페이지
	public ArrayList<CommunityVO> u_commulist(HashMap condMap) throws DataAccessException;
}
