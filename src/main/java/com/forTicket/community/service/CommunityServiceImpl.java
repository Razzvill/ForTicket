package com.forTicket.community.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.community.dao.CommunityDAO;
import com.forTicket.community.vo.CommunityVO;

@Service("communityService")
@Transactional(propagation = Propagation.REQUIRED)
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDAO communityDAO;
	
	@Override
	public ArrayList<CommunityVO> a_commulist(HashMap condMap) throws Exception {
		ArrayList<CommunityVO> a_commulist = communityDAO.a_commulist(condMap);
		return a_commulist;
	}

	@Override
	public ArrayList<CommunityVO> b_commulist(HashMap condMap) throws Exception {
		ArrayList<CommunityVO> b_commulist = communityDAO.b_commulist(condMap);
		return b_commulist;
	}

	@Override
	public ArrayList<CommunityVO> u_commulist(HashMap condMap) throws Exception {
		ArrayList<CommunityVO> u_commulist = communityDAO.u_commulist(condMap);
		return u_commulist;
	}
	
	//review 글 추가
	@Override
	public int add_review(CommunityVO communityVO) throws DataAccessException {
		return communityDAO.add_review(communityVO);
	}
	
	
}
